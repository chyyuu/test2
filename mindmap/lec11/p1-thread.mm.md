### 第一节 线程
- 为何需要线程?
  - 进程存在的不足
    - 进程之间地址空间隔离
    - 通过IPC共享/交换数据不方便
    - 管理进程开销大
      - 创建/删除/切换
    - 并行/并发处理困难
  - 在应用中可能同时发生多种活动，且某些活动会被阻塞
  - 将程序分解成可并行运行的多个顺序控制流
    - 可提高执行效率
    - 程序设计模型也会变得更简单
  - 永远存在的用户需求 -- 性能!
    - 并行实体（多个顺序控制流）共享同一个地址空间和所有可用数据
      - 访问数据和共享资源方便
      - 切换控制流轻量
      - 管理不同控制流便捷

- 线程的概念
  - 线程的定义
    - 线程是进程的一部分，描述指令流执行状态
    - 是进程中的指令执行流的基本单元，是CPU调度的基本单位
  - 线程 vs 进程
    - 线程是CPU调度的单位，进程是资源分配的单位
    - 线程拥有就绪、阻塞、执行三种基本状态，可以减少并发执行的时间和空间开销
    - 一个进程中可以同时存在多个线程，各个线程之间可以并发执行，共享地址空间和文件等资源
    - 当进程中的一个线程崩溃时，会导致其所属进程的所有线程崩溃    
    - 进程和线程的角色
      - 进程为资源分配角色，线程为处理机调度角色

- 线程的设计实现
  - 线程控制块 (TCB)
    - ```
      一个例子
      typedef struct
      {
            int                       detachstate;   // 线程的分离状态
            int                       schedpolicy;   // 线程调度策略 FIFO、RR等
            structsched_param         schedparam;    // 线程的调度参数 优先级
            int                       inheritsched;  // 线程的继承性
            int                       scope;         // 线程的作用域进程级、系统级
            size_t                    guardsize;     // 线程栈末尾的警戒缓冲区大小
            int                       stackaddr_set; // 线程的栈设置
            void*                     stackaddr;     // 线程栈的位置，起始地址
            size_t                    stacksize;     // 线程栈的大小
      } pthread_attr_t;
      ```
  - 线程API
    - 创建线程：pthread_create
    - 等待线程：pthread_join
  - 线程的几种实现方式
    - 用户态管理且用户态运行的线程（内核不可见的用户线程）
    - 内核态管理且用户态运行的线程（内核可见的用户线程）
    - 内核态管理且内核态运行的线程（内核线程）
    - 混合管理且运行的线程（轻量级进程，混合线程）
  - 线程的上下文切换
    - 不同进程中的线程切换
    - 相同进程中的线程切换




