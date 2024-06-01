### 第十三讲总结
- 知识点
- 内核 I/O 结构
- 设备发展历史
  - 简单设备
  - 多设备支持
  - 支持中断设备
  - 高吞吐量设备
- 设备类型
  - 字符设备：GPIO, 键盘/鼠标, 串口等
  - 块设备：磁盘驱动器、磁带驱动器、光驱等
  - 网络设备：ethernet、wifi、bluetooth
- 设备访问特征
  - 字符设备：字节顺序访问，get()/put()命令，文件接口语义
  - 块设备：数据块访问，原始I/O或文件系统接口，内存映射文件访问
  - 网络设备：报文交换，send/receive报文，socket接口语义
- 设备传输方式
  - 程序控制 I/O (PIO)
  - 中断传输方式
  - 直接内存访问 (DMA)
- CPU与设备连接
- I/O请求生命周期
- I/O执行模型
    - 接口交互协议
      - 轮询的设备接口
      - 中断的设备接口
    - 设备抽象
      - 文件的 I/O 设备抽象
      - 流的 I/O 设备抽象
      - virtio的 I/O 设备抽象
    - I/O分类和比较
      - blocking I/O
      - nonblocking I/O
      - I/O multiplexing
      - signal driven I/O
      - asynchronous I/O
- 磁盘工作机制和性能参数、磁盘 I/O 传输时间
- 磁盘调度算法
  - 目标：减少最耗时的寻道时间
  - 思路：通过优化磁盘访问请求顺序来提高磁盘访问性能 
  - FIFO (先进先出算法)
  - 最短服务时间优先 (SSTF)
  - 扫描算法 (SCAN)
  - 循环扫描算法 (C-SCAN)
  - N步扫描算法 (N-step-SCAN)
  - 双队列扑描算法 (FSCAN)
- 实践：支持device的OS（DOS）
  - 进化目标
    - 对外设高效访问支持
  - DOS实践目标
    - 设备与CPU交互
    - 内核中断响应
  - RISC-V相关的硬件信息
    - PLIC
    - CLINT
    - 系统外设：
      - UART
      - virtio-blk磁盘块
      - virtio-input键盘
      - virtio-gpu显示
  - 程序设计
    - 设备操作：初始化、中断处理、I/O读写
    - OS交互需求：内存服务、中断调度服务等

