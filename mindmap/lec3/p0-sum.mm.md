### 第三讲总结
- 知识点
  	- OS与硬件的关系
    	- OS与硬件的接口/边界
    	- OS对硬件的抽象
    - OS与APP的关系
      - OS与APP的接口/边界
    - 隔离的定义、目标与方法 
  	- 特权级定义
    	- 特权级切换
      - 中断/异常
  	- 系统调用的定义/特征/实现
  		- 系统调用设计与实现
    	- 系统调用执行过程 
  	- RISC-V特权级
      	- U-Mode/S-Mode/M-Mode
        	- 哪些软件/固件适合运行在哪种特权级模式
      	- 控制状态寄存器(CSR)	
        	- scause、sepc、stvec、stval、sstatus、satp
  	- 外设中断
    	- 中断处理过程
      	- RISC-V S-Mode下的中断处理
        	- 硬件直接的中断处理
        	- 软件的中断处理
  	- 软件异常
    	- 异常处理过程
      	- RISC-V S-Mode下的异常处理
        	- 硬件直接的异常处理
        	- 软件的异常处理 
    - 中断、异常、系统调用的异同点
  	- 批处理操作系统的设计与执行
    	- 用户栈与内核栈的切换
    	- sscratch CSR的作用
    	- Trap上下文及其处理过程
    	- 对运行用户态任务的支持






