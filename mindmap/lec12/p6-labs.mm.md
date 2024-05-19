### 第六节 支持同步互斥的OS(SMOS)
- 进化目标
  - 在多线程中支持对共享资源的同步互斥访问
- 总体思路
  - 使用互斥锁、信号量、管程与条件变量等机制实现同步互斥
- 历史背景
  - 早期操作系统如THE多道程序系统引入信号量
  - Brinch Hansen 和 Hoare 提出高级同步原语：管程
- 实践步骤
  - 克隆并检出 rCore 教学操作系统，研究并实践同步互斥功能
- 程序设计
  - 深入理解并实现互斥锁、信号量和条件变量等核心同步互斥概念
- 全局变量累加应用
  - 描述
    - 多个线程对全局变量进行累加操作可能引发竞态条件
  - 实现方式
    - 基于原子操作、互斥锁及其他同步机制避免竞态条件
- 互斥锁
  - 功能
    - 保证在任一时刻只有一个线程可以访问某个资源或代码块
  - 应用示例
    - 保护全局变量不受并发访问导致的数据不一致问题
- 信号量
  - 功能
    - 用于控制对资源的访问数量，实现进程间的协作和互斥
  - 应用示例
    - 控制同时访问某个资源的最大线程数量
- 管程与条件变量
  - 功能
    - 管程提供一种方法，使得多线程间可以安全地共享资源或通信
    - 条件变量用于线程间的同步，如阻塞等待某个条件成立
  - 应用示例
    - 解决生产者-消费者问题，其中生产者和消费者线程通过管程中的条件变量来同步它们的行为



