### 第一节 概述

  - 背景
    - 进/线程如果有资源共享
      - 存在不确定性
      - 存在不可重现
      - 可能出现难以重现的错误
    - 带资源共享的进/线程执行fork时的可能错误
    - 原子操作（Atomic Operation）
      - 定义：一次不存在任何中断或失败的操作
        - 要么操作成功完成
        - 或者操作没有执行
        - 不会出现部分执行的状态
    - 操作系统需要利用同步机制在并发执行的同时，保证一些操作是原子操作
    - 临界区（Critical Section）
      - 结构
        - entry section
        - critical section
        - exit section
        - remainder section
      - 访问规则
        - 空闲则入：没有线程在临界区时，任何线程可进入
        - 忙则等待：有线程在临界区时，其他线程均**不能**进入临界区
        - 有限等待：等待进入临界区的线程**不能**无限期等待
        - 让权等待（可选）：不能进入临界区的线程，应释放CPU（如转换到阻塞状态）
  - 同步互斥的方法
    - 禁用硬件中断
    - 基于软件的解决方法
      - 2线程：Peterson算法
        - ```rust
          // 共享变量
          let mut flag = [false; N]; // 标识进程是否请求进入临界区
          let mut turn = 0; // 记录应该让哪个进程进入临界区
          // 进程P0
          while (true) {
              flag[0] = true;
              turn = 1;
              while (flag[1] == true && turn == 1) ;
              // 进入临界区执行任务
              // 退出临界区
              flag[0] = false;
          }
          // 进程P1
          while (true) {
              flag[1] = true;
              turn = 0;
              while (flag[0] == true && turn == 0) ;
              // 进入临界区执行任务
              // 退出临界区
              flag[1] = false;
          }
          ```
      - 2线程：Dekkers算法
        - ```rust
          do{
            flag[0] = true;// 首先P0举手示意我要访问
            while(flag[1]) {// 看看P1是否也举手了
              if(turn==1){// 如果P1也举手了，那么就看看到底轮到谁
                  flag[0]=false;// 如果确实轮到P1，那么P0先把手放下（让P1先）
                  while(turn==1);// 只要还是P1的时间，P0就不举手，一直等
                  flag[0]=true;// 等到P1用完了（轮到P0了），P0再举手
              }
            }
            critical section;// 访问临界区
            turn = 1;// P0访问完了，把轮次交给P1，让P1可以访问
            flag[0]=false;// P0放下手
            remainder section;
          } while(true);
          ```
      - N进程：Eisenberg和McGuire
        - 一个共享的turn变量，若干线程排成一个环
        - 每个环有个flag标志，想要进入临界区填写flag标志
        - 有多个想进入临界区，从前往后走，执行完一个线程，turn改为下一个线程的值
        - ```rust
          //============================
          //INITIALIZATION:
          //============================
          enum states flags[n -1]; //{IDLE, WAITING, ACTIVE}
          int turn;
          for (index=0; index<n; index++) {
            flags[index] = IDLE;
          }
          //============================
          // ENTRY PROTOCOL (for Process i ):
          //============================
          repeat {//从turn到i是否存在请求进程:若存在，则不断循环，直至不存在这样的进程，将当前进程标记为ACTIVE
            flags[i] = WAITING;//表明自己需要资源
            index = turn;//轮到谁了
            while (index != i) {//从turn到i轮流找不idle的线程
                if (flag[index] != IDLE) index = turn;//turn到i有非idle的阻塞
                else index = (index+1) mod n; //否则轮到i，并跳出
            }
            flags[i] = ACTIVE;//Pi active; 其他线程有可能active
            //对所有ACTIVE的进程做进一步的判断，判断除了当前进程以外，是否还存在其他ACTIVE的进程
            index = 0;//看看是否还有其他active的
            while ((index < n) && ((index == i) || (flags[index] != ACTIVE))) {
                index = index+1;
            }//如果后面没有active了，并且轮到Pi或者turn idle, 就轮到i;否则继续循环
          } until ((index >= n) && ((turn == i) || (flags[turn] == IDLE)));
          turn = i;//获得turn并处理
          //============================
          // EXIT PROTOCOL (for Process i ):
          //============================
          index = turn+1 mod n;//找到一个不idle的
          while (flags[index] == IDLE) {
            index = index+1 mod n;
          }
          turn = index;//找到不idle的设置为turn；或者设置为自己
          flag[i] = IDLE;//结束，自己变idle
          ``` 
    - 更高级的抽象方法
      - 利用硬件原语来构建更高级的同步抽象，如锁、信号量等
      - 锁的使用示例和原理
        - Lock::Acquire() 和 Lock::Release()
        - 硬件原子操作指令
          - Test-and-Set
            - ```
              //语义实现伪码
              function Test_and_Set(lock):
                old_value = lock   // 保存当前锁的值
                lock = true        // 将锁设置为true，表示资源被占用
                return old_value   // 返回锁的原始值
              ```
            - ```
              //使用伪码
              lock = false; // 初始化锁
              while (Test_and_Set(lock)) ; // 等待锁释放
              // 临界区
              lock = false; // 释放锁
              ```  
          - Compare and Swap
            - ```
              //语义实现伪码
              function Compare_and_Swap(memory_location, expected_value, new_value):
              if memory_location.value == expected_value:
                  memory_location.value = new_value
                  return true
              else:
                  return false
              ```
            - ```
              //使用伪码
              int lock = 0;                           // 初始时锁空闲 
              while(!compare_and_swap(&lock,0,1));    // lock 加锁
              critical section; 
              lock=0;                                 // unlock 解锁
              remainder section;            
              ```  
        - 忙等锁 vs. 等待锁
        - 锁的优点
          - 适用于单处理器或者共享主存的多处理器中任意数量的线程同步
          - 简单并且容易证明
          - 支持多临界区
        - 锁的缺点
          - 忙等待消耗处理器时间
          - 可能导致饥饿
          - 线程离开临界区时有多个等待线程的情况
          - 可能死锁：线程间相互等待，无法继续执行





