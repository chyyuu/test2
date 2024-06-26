### 第二节 Compiler与OS

- 提纲
  - 硬件环境
  - 应用程序执行环境
  - 操作系统执行环境

- 硬件环境
  - 开发的硬件环境 (x86 架构)
  - 目标硬件环境 (RISC-V 架构)

- 应用程序执行环境
  - 编译器工作
    - 源码转换为汇编码
  - Assembler（汇编器）工作
    - 汇编码转换为机器码
  - Linker（链接器）工作
    - 多个机器码目标文件合并为单个机器码执行文件
  - OS工作
    - 加载/执行/管理机器码执行文件

- 操作系统执行环境
  - Compiler/Assembler/Linker 工作流程
    - 从源码到汇编码，再到机器码，最后生成执行程序
    - Bootloader加载OS执行
  - 可执行文件格式
    - 三元组: CPU架构/厂商/操作系统
      - 示例: riscv32gc-unknown-linux-gnu, riscv64gc-unknown-none-elf
      - ELF: Executable and Linkable Format
  - 链接和执行过程展示
  - 函数库
    - 标准库 (依赖操作系统)
      - Rust: std 标准库
      - C：glibc, musl libc 
    - 核心库 (与操作系统无关)
      - Rust: core 核心库
      - C: Linux/BSD kernel libc
  - 裸机程序
    - 定义: 与操作系统无关的OS类型的程序 (Bare Metal program)
    - 示例代码及配置
  - ELF文件格式和文件头信息
    - 文件格式详情
    - 反汇编导出汇编程序指令
    - 主要段和内存布局
      - .text: 代码段
      - .rodata: 已初始化数据段，只读
      - .data: 可修改的全局数据
      - .bss: 未初始化数据段
      - 堆 (heap) 向高地址增长
      - 栈 (stack) 向低地址增长

