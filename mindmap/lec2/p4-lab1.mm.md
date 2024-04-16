- 第四节 实践：裸机程序 -- LibOS

  - 提纲
    - 实验目标和思路
    - 实验要求
    - 实践步骤
    - 代码结构
    - 内存布局
    - 基于 GDB 验证启动流程
    - 函数调用
    - LibOS初始化
    - SBI调用

  - LibOS的实验目标
    - 概念：裸机程序（Bare Metal Program）
      - 与操作系统无关的OS类型的程序
    - 功能：
      - 建立应用程序的执行环境
        - 让应用与硬件隔离
        - 简化应用访问硬件的难度和复杂性
      - 提供执行环境（Execution Environment）

  - LibOS历史背景
    - 1949-1951年，J. Lyons and Co. 引入EDSAC计算机，联合设计LEO I系统
    - 子程序概念的引入
      - David Wheeler 发明子程序概念 – Wheeler Jump
      - 子程序库形成了最早的操作系统原型

  - LibOS总体思路
    - 编译：设置编译器支持裸机程序
    - 构造：建立栈和SBI服务请求接口
    - 运行：OS的起始地址和执行环境初始化

  - 实验要求
    - 理解LibOS的执行过程
      - 编写、编译、运行裸机程序
      - 懂得基于裸机程序的函数调用
      - 能看懂汇编代码伪代码和内嵌汇编代码
      - 初步理解SBI调用

  - 实践步骤
    - 开发与实验环境准备
    - 移除标准库依赖
    - 支持函数调用
    - 基于SBI服务完成输出与关机
    - 理解程序的内存空间和栈

  - 代码结构
    - os/src: 主要代码目录
      - console.rs: 格式化输出实现
      - entry.asm: 设置执行环境的汇编代码
      - lang_items.rs: 包含panic处理逻辑
      - linker-qemu.ld: 控制内核内存布局的链接脚本
      - main.rs: 内核主函数
      - sbi.rs: 调用底层SBI实现提供的接口

  - 内存布局
    - .text: 代码段
    - .rodata: 已初始化数据段，只读
    - .data: 可修改的全局数据
    - .bss: 未初始化数据段
    - 堆 (heap) 向高地址增长
    - 栈 (stack) 向低地址增长

  - 基于 GDB 验证启动流程
    - 使用GDB连接至QEMU进行调试
    - 分析加载和执行流程

  - 函数调用
    - ABI 和 SBI 接口详解
    - 函数调用、返回和寄存器使用约定
    - 栈帧的管理和使用

  - LibOS初始化
    - 从ASM到Rust的控制权转交
    - 清空bss段以初始化未分配的全局变量

  - SBI调用
    - SBI服务接
    - SBI服务接口
    - SBI服务编号
    -  汇编级SBI调用
    -  SBI调用：输出字符
    -   SBI调用：关机
    -  优雅地处理错误panic
    -  LibOS完整功能