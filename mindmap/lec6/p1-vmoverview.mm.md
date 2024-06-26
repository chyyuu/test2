### 第一节: 虚拟存储概念
- 虚拟存储技术的需求
  - 需求背景
    - 程序规模增长迅速，内存需求大于可用内存
    - 理想中的存储器特性：大容量、快速度、低成本、非易失性
  - 基本思路
    - 内存不够时，外存来补，使用覆盖、交换和虚拟存储技术
- 覆盖技术
  - 目标
    - 让程序员手动在较小的内存中运行较大程序
  - 基本原理
    - 不同时间段的函数或模块共享一块内存空间
  - 示例与不足
    - 增加编程复杂度和执行时间
- 交换技术
  - 基本思路
    - 操作系统以程序为单位自动换入换出内存
  - 面临的问题
    - 何时发生交换，程序如何重定位
  - 交换区大小建议与技术比较
    - 对比覆盖和交换技术
- 虚拟存储的基本概念
  - 定义与思路
    - 虚拟存储 = 内存 + 外存
  - 局部性原理
    - 程序执行中数据和指令的访问集中在短时间和小区域内
  - 虚拟存储的基本特征
    - 不连续性、大用户空间、部分交换
  - 底层支撑
    - 硬件（MMU/TLB/PageTable）和软件（OS）
- 缺页异常
  - 处理流程
    - 从产生缺页到修改页表项，并重新执行指令
  - 性能考虑
    - 缺页率、写回概率与有效存储访问时间(EAT)
  - 存储位置
    - 交换空间和磁盘文件
