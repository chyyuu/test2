### 第二节: 局部页面置换算法
- 页面置换算法的基本概念
  - 功能
    - 选择被置换的物理页面
  - 设计目标
    - 减少缺页次数和换入/换出次数
  - 评价方法
    - 记录并模拟页面访问，统计缺页次数
- 最优页面置换算法 (OPT, optimal)
  - 工作原理
    - 置换在未来最长时间不访问的页面
  - 特征和示例
    - 缺页最少，理想情况下的算法，无法预知未来访问
- 先进先出页面置换算法 (FIFO)
  - 工作原理
    - 选择驻留时间最长的页面进行置换
  - 特征和示例
    - 实现简单，性能较差，可能会有Belady现象
- 最近最久未使用页面置换算法 (LRU, Least Recently Used)
  - 工作原理
    - 选择最长时间没有被引用的页面进行置换
  - 特征和示例
    - LRU是最优算法的一种近似，实现开销大
- 时钟页面置换算法 (Clock)
  - 工作原理
    - 环形链表形式，选择访问位为0的页面进行置换
  - 特征和示例
    - 是LRU和FIFO的折中，实现相对简单
- 改进的时钟页面置换算法
  - 工作原理
    - 类似时钟算法，但跳过修改过的页面以避免频繁写入
  - 特征和示例
    - 减少了写入外存的次数，适用于写操作较多的场景
- 最不常用页面置换算法 (LFU, Least Frequently Used)
  - 工作原理
    - 置换访问频率最低的页面
  - 特征和示例
    - 开销大，可能保留长期不用但曾经频繁访问的页面
- Belady现象
  - 定义
    - 分配的物理页面数增加时，缺页次数反而升高的异常现象
  - 触发条件
    - 使用FIFO等算法时可能触发，因为这些算法与程序访问内存的动态特征矛盾
