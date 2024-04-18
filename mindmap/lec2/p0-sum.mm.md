### 第二讲总结
- 知识点
  	- 函数调用、栈帧与参数
      	- 函数调用与系统调用的区别
      	- RISC-V函数调用约定
        	- 传递参数的寄存器 a0~a7
        	- 返回值寄存器 a0
        	- caller-saved 寄存器列表
        	- callee-saved 寄存器列表
  	- 编译器/硬件与OS之间的共识
  	- 加电后硬件/软件启动过程
      	- QEMU启动参数的含义
        	- 物理内存大小、起始位置
        	- OS的放置位置
        	- Bootloader的加载
      	- QEMU中的firmware代码及及其含义
      	- QEMU模拟RISC-V计算机的冷启动过程
        	- firmware --> bootloader(rust-sbi) --> uCore/rCore
  	- 开发环境
    	- 编译器、Assembler、Linker
    	- ELF执行文件格式基本含义
    	- linker.ld的含义
  	- 执行环境
    	- OS加载/执行/管理进程
    	- 程序执行中内存布局
  	- LibOS的设计与执行
  		- 裸机编程
    		- 进一步理解App/OS内存布局
    		- 汇编函数 --> Rust/C函数
  		- 裸机程序执行过程
      		- 裸机程序初始化
        		- 建立栈
    	- RISC-V的SBI
        	- SBI服务
        	- 发出SBI调用的汇编代码





