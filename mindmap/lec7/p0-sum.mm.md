### 第七讲总结
- 知识点
	- 进程概念
    	- 任务与进程的关系
	- 进程运行状态与进程生命周期
    	- 孤儿进程
    	- 僵尸进程
	- 进程管理
    	- 进程控制块
        	- 进程控制块包含了进程的哪些内容
        	- 进程控制块是进程的唯一标识
    	- 进程切换
      - 相关系统调用与进程运行状态的关系
	- 调度策略/算法
    	- 基本调度策略/算法的设计思路
        	- 评价指标
        	- FCFS
        	- SJF
        	- SRT
        	- HRRN
        	- MQ
        	- MLFQ
      	- 实时调度策略/算法的设计思路
      	- 评价指标
      	- 可调度性概念
      	- 静态优先级调度与动态优先级调度
      	- 实时调度算法
          	- 速率单调调度算法
          	- 最早截止时间优先算法
          	- 最低松弛度优先算法
      	- 优先级反置问题及其解决方案
          	- 优先级继承(Priority Inheritance)策略
          	- 优先级天花板协议（priority ceiling protocol）
	- 支持进程的操作系统的设计与执行
    	- 进程控制块的扩展内容及其含义
    	- 第一个用户态进程的创建过程及该进程的主要功能
    	- 进程管理系统调用的实现及其之间的关系
        	- fork
        	- exec
        	- waitpid
        	- exit

