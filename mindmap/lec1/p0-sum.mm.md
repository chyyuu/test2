### 第一讲总结
- 知识点
	- 操作系统定义
		- 操作系统是**管理硬件资源**、控制程序运行、改善人机界面和**为应用软件提供支持**的一种系统**软件**
	- 内核基本抽象
		- 进程 -- CPU
		- 文件 -- 存储(I/O)设备
		- 地址空间 -- 内存(+存储)
	- 内核特征
		- 并发
		- 共享
		- 虚拟
		- 异步 
	- 内核演进
		- 批处理系统
    		- 一次只加载一个任务/作业到内存中执行 
		- 多道程序系统
    		- 可加载多个不同任务/作业到内存中执行 
		- 分时系统
      	- 可加载多个不同任务到内存中执行 
				- CTSS
				- Multics
				- UNIX + C -- Ken Thompson + Dennis Ritchie
				- Linux	使用最广泛的OS
				- Android with Linux kernel
	- 内核架构
		- 简单结构 -- DOS
		- 单体分层结构（宏内核） -- UNIX
		- 微内核 -- Mach、seL4、MINIX
		- 外核 -- exokernel from MIT，演进为虚拟机管理器 VMM or Hypervisor  
	- 实践能力
		- 会使用基本Linux命令: ls、rm、gcc、gdb、make、git、ps、cat
		- 了解Linux基本系统调用：fork、exit、wait、kill、getpid、sleep、exec、sbrk、open、write、read、close、dup、pipe、chdir、mkdir、mknod、fstat、stat、link、unlink
		- 理解、编译、运行Linux程序：fork.c、exec.c、forkexec.c等




