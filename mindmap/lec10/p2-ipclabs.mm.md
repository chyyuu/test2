### 第二节 实践：支持IPC的OS (IPC OS, IOS)

- 实验目标
  - 支持应用的灵活性，支持进程间交互
    - 扩展文件抽象：Pipe，Stdout, Stdin
    - 以文件形式进行进程间数据交换
    - 以文件形式进行串口输入输出  
    - 信号实现进程间异步通知机制
    - 系统调用数量：11个 --> 17个
      - 管道：2 个、用于传数据
      - 信号：4 个、用于发通知
- 实验要求
  - 理解文件抽象
  - 理解IPC机制的设计与实现
    - pipe
    - signal
  - 会写支持IPC的OS
- 管道的设计实现  
  - 管道实现需要考虑的问题
    - 管道是啥？
    - 如何访问管道？
    - 如何管理管道？
  - 理解管道
    - 管道是内核中的一块内存，顺序写入/读出字节流
    - 管道可抽象为文件，进程中包含管道文件描述符
      - 应用创建管道的系统调用：`sys_pipe`
    - 管道与进程的关系
      - `pipe`是进程控制块的资源之一
  - 设计管道
      - 基于文件抽象，支持I/O重定向
        - [K] 实现基于文件的标准输入/输出
           - 1 实现基于文件的标准输入/输出（FD：0 -- Stdin ; 1/2 -- Stdout）
           - 2 创建TCB时初始化fd_table（Some(Arc::new(Stdin))，...） 
           - 3 fork时复制fd_table
        - [K] 实现基于文件的实现管道
           - 1 管道的系统调用： pub fn sys_pipe(pipe: *mut usize) -> isize;
           - 2 创建管道中的Buffer：pub struct PipeRingBuffer { arr: [u8; 
           RING_BUFFER_SIZE], ...}
           - 3 实现基于文件的输入/输出接口(read/write)
           - 4 复制文件描述符系统调用：pub fn sys_dup(fd: usize) -> isize;
        - [U] 支持命令行参数
           - 1 sys_exec 的系统调用接口需要发生变化
           - 2 shell程序的命令行参数分割
        - [U] 支持 “|" 符号
           - 扩展 "user/src/bin/user_shell.rs"    
- 信号的设计实现
  - 信号实现需要考虑的问题
    - 信号是啥？
    - 如何使用信号？
    - 如何管理信号？
  - 理解信号
    - `signal`是内核通知应用的软件中断
    - 准备阶段
      - 设定`signal`的整数编号值
      - 建立应对某`signal`编号值的例程`signal_handler`
    - 执行阶段
      - 向某进程发出signal，打断进程的当前执行，转到`signal_handler`执行
    - 信号与进程的关系
      - signal是进程控制块的资源之一
  - 设计信号
    - signal的系统调用
      - sigaction: 设置信号处理例程
      - sigprocmask: 设置要阻止的信号
      - kill: 将某信号发送给某进程
      - sigreturn: 清除堆栈帧，从信号处理例程返回
    - signal核心数据结构
      - ```rust 
        pub struct TaskControlBlockInner {
          ...
          pub signals: SignalFlags,     // 要响应的信号
          pub signal_mask: SignalFlags, // 要屏蔽的信号
          pub handling_sig: isize,      // 正在处理的信号
          pub signal_actions: SignalActions,       // 信号处理例程表
          pub killed: bool,             // 任务是否已经被杀死了
          pub frozen: bool,             // 任务是否已经被暂停了
          pub trap_ctx_backup: Option<TrapContext> //被打断的trap上下文
        }
        ```
    - 建立signal_handler
      - 对于需要修改的信号编号signum：
         - 1 保存老的signal_handler地址到old_action
         - 2 设置action为新的signal_handler地址
    - 支持kill系统调用
      - 对进程号为pid的进程发送值为signum的信号：
         - 1 根据pid找到TCB
         - 2 在TCB中的signals插入signum信号值
      - 通过kill发出和处理信号的过程
        - ```
          执行APP --> __alltraps 
                  --> trap_handler 
                      --> handle_signals 
                          --> check_pending_signals 
                              --> call_kernel_signal_handler
                              --> call_user_signal_handler
                                -->  // backup trap Context
                                      // modify trap Context
                                      trap_ctx.sepc = handler; //设置回到中断处理例程的入口
                                      trap_ctx.x[10] = sig;   //把信号值放到Reg[10]
                      --> trap_return //找到并跳转到位于跳板页的`__restore`汇编函数
                -->  __restore //恢复被修改过的trap Context，执行sret
          执行APP的signal_handler函数
          ```
      - APP恢复正常执行
        - 当进程号为pid的进程执行完signal_handler函数主体后，会发出sys_sigreturn系统调用:
           - ```rust
              fn sys_sigreturn() -> isize {
                ...
                // 恢复之前备份的trap上下文
                let trap_ctx = inner.get_trap_cx();
                *trap_ctx = inner.trap_ctx_backup.unwrap();
                ...
              执行APP --> __alltraps 
                    --> trap_handler 
                          --> 处理 sys_sigreturn系统调用
                          --> trap_return //找到并跳转到位于跳板页的`__restore`汇编函数
                  -->  __restore //恢复被修改过的trap Context，执行sret
              执行APP被打断的地方
              ```    
      - 屏蔽信号
        - 把要屏蔽的信号直接记录到TCB的signal_mask数据中
          - ```rust
            fn sys_sigprocmask(mask: u32) -> isize {
                ...
                inner.signal_mask = flag;
                old_mask.bits() as isize
                ...
            ```



