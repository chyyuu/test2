### 第九讲总结
- 知识点
	- 文件系统基本概念
    	- 文件
        	- 文件控制块
        	- 文件中的数据
    	- 目录
        	- 目录项
     	- 文件描述符
         	- 打开的文件
         	- 打开文件描述符表
    	- 文件别名
        	- 软链接
        	- 硬链接
    	- 虚拟文件系统
      - 文件访问控制
	- 文件系统设计与实现
		- 文件系统总体结构
		- 文件相关系统调用的设计与执行
    		- open
    		- close
    		- read
    		- write
		- 链式/索引文件结构设计
		- 空闲磁盘块空间管理
		- 缓冲区管理
  - 支持崩溃一致性的文件系统 
      - 崩溃一致性问题
      - 崩溃场景分析
      - 数据日志（data journaling）
      - 元数据日志（Metadata Journaling）
  - 实践：支持文件的操作系统
  	- OS对EasyFS文件系统的支持：数据结构&执行流程
  	- EasyFS文件系统的设计与实现：数据结构&执行流程
  	- 进程与文件系统之间的关联关系：数据结构&执行流程
    - 应用至库至设备驱动的完整文件访问过程

