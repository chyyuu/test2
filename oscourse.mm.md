# OS

## 第一讲 操作系统概述

    - 第一节 课程概述 & 教学安排
      - [课程幻灯片列表](https://www.yuque.com/xyong-9fuoz/qczol5/ewvhdy3epbwbkn3n)
      - 课程信息
          - 主讲教师：向勇 陈渝 李国良 任炬
          - 助教：饶淙元、田凯夫、闭浩扬、王拓为、苏明贤、黄旺、郝子胥
      - 上课信息
          - 上课时间地点
          - 时间：星期一 第2大节 上午09:50-12:15 (1-16周) 
          - 地点：六教6A209（任）六教6A211（李）六教6A213（陈）
      - 预备知识
          - 程序设计语言（汇编、C 和 Rust）
          - 不是开发应用程序 :confounded:
          - 而是开发系统程序 :smile:
          - 数据结构
          - 理解基本数据结构即可 :smile:
          - 计算机组成原理
          - 刘总/康总/陆总的 RISC-V 原理 :smile: :smile: :smile:
          - Patterson 的 RISC-V 原理 :smile:
          - 编译原理
          - 没学过影响不大 :smile:
          - 但还是要了解高级语言 <–>RISC-V 汇编语言 :smile:
      - 课程参考与实践
          - [课程幻灯片](https://www.yuque.com/xyong-9fuoz/qczol5/ewvhdy3epbwbkn3n)
          - 参考书籍
          - [Operating Systems: Three Easy Pieces](https://pages.cs.wisc.edu/~remzi/OSTEP/)
          - [深入了解计算机系统](https://hansimov.gitbook.io/csapp/)
          - [RISC-V Reader中文版](http://riscvbook.com/chinese/RISC-V-Reader-Chinese-v2p1.pdf)
          - 课程实践
          - [rCore Tutorial Book v3](https://learningos.github.io/rCore-Tutorial-Book-v3/)
          - [代码仓库](https://github.com/rcore-os/rCore-Tutorial-v3)
          - [API文档](https://github.com/rcore-os/rCore-Tutorial-v3#os-api-docs)
      - 实验指导
          - uCore Tutorial
          - [实验代码](https://github.com/LearningOS/uCore-Tutorial-Code-2024S/)
          - [实验文档](https://learningos.github.io/uCore-Tutorial-Guide-2024S/)
          - [测试用例](https://github.com/LearningOS/uCore-Tutorial-Test-2024S/)
          - rCore Tutorial
          - [实验文档](https://learningos.github.io/rCore-Tutorial-Guide-2024S/)
          - [API文档](https://github.com/LearningOS/rCore-Tutorial-Guide-2024S/#os-api-docs-of-rcore-tutorial-code-2022a)
          - [实验代码](https://github.com/LearningOS/rCore-Tutorial-Code-2024S)
          - [测试用例](https://github.com/LearningOS/rCore-Tutorial-Test-2024S)
          - [uCore和rCore实验帮助](https://www.yuque.com/xyong-9fuoz/qczol5/lt5qafszpz62hob1?singleDoc)
          - 讲解视频
          - 部分内容将逐步更新
      - OS 原理与设计思想
          - 操作系统结构
          - 中断及系统调用
          - 内存管理
          - 进程管理
          - 处理机调度
          - 同步互斥
          - 文件系统
          - I/O 子系统
      - 作业与实验
          - 平时作业
          - 课后练习：包括问答题和编程题目，要求在deadline前提交
          - 基础实验
          - （必做）面向 RISC-V CPU 用 Rust/C 设计实现操作系统的功能
          - （选做）难度和工作量比必做题目大的其它题目
          - 课程设计（大实验）
          - 用组件来组合操作系统内核
          - 参加全国大学生OS比赛
      - 基础实验详细内容
          - 实验一：操作系统的基本支持
          - 实验二：地址空间
          - 实验三：进程管理与调度
          - 实验四：文件系统与进程间通信
          - 实验五：同步互斥
      - 课程设计（大实验）
          - 用组件来组合操作系统内核
          - 组件化操作系统[ArceOS](http://arceos.org/overview.html)
          - 操作系统功能和扩展
          - 内核模块的完善和改进
          - 内核可加载模块、微内核、在内核中引入异步编程
          - 支持多种处理器架构和硬件平台
          - GUI、驱动、文件系统、网络
          - 往届同学的[课程设计成果](https://shimo.im/docs/QTPRT8h8jyGQCqkJ)
      - 成绩评定
          - 选择1
          - 实验一~五必做题目：40%
          - 期中考试：20%
          - 期末考试：40%
          - 加分：平时作业每做一次加1分，最高加5分
          - 选择2
          - 四周内完成实验一~五：40%
          - 课程设计（即大实验）：60%
      - 调查问卷
          - [2024年春季学期操作系统课选课问卷](http://oscourse2019.mikecrm.com/TdGsawl)

    - 第二节 什么是操作系统
        - 操作系统定义
          - 没有公认的精确定义
          - 功能
            - 管理硬件资源
            - 控制程序运行
            - 改善人机界面
            - 为应用软件提供支持
          - 描述来源: [计算机百科全书]

        - 操作系统的角色
          - 资源管理程序
            - 应用与硬件之间的中间层
            - 管理各种软硬件资源
            - 提供访问软硬件资源的服务
            - 解决访问冲突，确保公平使用
          - 控制程序
            - 执行程序，给程序提供服务
            - 控制程序执行过程，防止错误
            - 方便用户使用计算机系统

        - 操作系统的软件分类
          - Shell: 命令行接口
          - GUI: 图形用户接口
          - Kernel: 操作系统的内部

        - uCore/rCore 教学操作系统内核
          - 内核结构图展示

        - 操作系统内核的抽象
          - 内核抽象图展示

        - 操作系统内核的特征
          - 并发: 多个程序同时运行
          - 共享: 程序间“同时”访问互斥共享资源
          - 虚拟: 每个程序“独占”一台完整计算机
          - 异步: 服务完成时间不确定，可能失败

        - 对操作系统内核的理解
          - 用户/应用对操作系统的需求
            - 高效性 vs 易用性
            - 强大的操作系统服务 vs 简单的接口
            - 灵活性 vs 安全性

        - 为什么要学习这门课程
          - 了解计算机机壳后面的软硬件运行原理
          - 学习软硬件基础架构和原理
          - 深入了解程序运行机理
          - 发现并修复难以对付的bug
    - 第三节 操作系统历史演化
        - 操作系统的历史发展
        - 单用户系统 (1945-1955)
            - 手动连线/纸带传输进行程序输入
            - 机器成本远大于人力成本
            - 操作系统 = 装载器 + 程序库
            - 问题：昂贵组件的低利用率
        - 批处理系统 (1955-1965)
            - 磁带/磁盘传输进行程序输入
            - 操作系统 = 装载器 + 程序控制器 + 输出处理器
            - 问题：相比以前利用率提高
        - 多道程序系统 (1955-1980)
            - 多个程序驻留内存中
            - 多个程序轮流使用 CPU
            - 操作系统 = 装载器 + 程序调度 + 内存管理 + 输出管理
            - 演变：相比以前利用率提高
        - 分时系统 (1970-至今)
            - 多个程序分时使用 CPU
            - 操作系统 = 装载器 + 程序调度 + 内存管理 + 中断处理
            - 演变：利用率提高、交互延时缩短

        - 操作系统家族和影响
        - Multics OS
            - 高级别安全和多用户操作系统
        - UNIX（Ken Thompson 与 Dennis Ritchie）
            - 开放系统，多用户支持
        - Linux家族
            - 开源和自由软件运动的产物
        - 个人电脑 (1981- )
            - 单用户
            - 重点是用户界面和多媒体功能
            - 操作系统 = 装载器 + 程序调度 + 内存管理 + 中断处理
            - 演变：走向大众，老的服务和功能不存在，越来越多的安全问题
        - MacOS家族
            - 基于UNIX的图形界面系统
        - Windows家族
            - 微软开发，主导个人计算市场

        - 特定领域操作系统
        - 分布式系统 (1990- )
            - 分布式多用户
            - 重点是网络/存储/计算的效率
            - 操作系统 = 分布式（装载器 + 程序/OS 调度 + 内存管理）
            - 演变：走向网络，新的挑战（不可靠/不确定性）
        - Android操作系统
            - 跨平台：支持Java应用程序
            - 运行时：Android虚拟机
            - 应用框架：简化应用程序开发
        - AIoT操作系统
            - 分布式多设备
            - 重点是网络/存储/计算的效率
            - 操作系统 = 分布式（程序/OS 调度 + 内存管理 + 安全/更新）
            - 演变：走向设备，走向网络，新的挑战（不可靠/大数据）

    - 第四节 操作系统结构
        - 操作系统的不同结构
        - 简单结构
            - MS-DOS：应用和OS混在一起 (1981–1994)
            - 没有拆分为模块
            - 主要用汇编编写
            - 没有安全保护
            
        - 单体分层结构
            - 将单体操作系统划分为多层
            - 每层建立在低层之上
            - 最底层 (layer 0) 是硬件驱动
            - 最高层 (layer N) 是用户界面
            - 每一层仅使用更低一层的功能和服务
        
        - 微内核结构 (Micro Kernel)
            - 尽可能把内核功能移到用户空间
            - 用户模块间通信使用消息传递
            - 好处: 灵活、安全...
            - 缺点: 性能问题
            - LPC: 本地过程调用
            - HAL: 硬件抽象层
        
        - 外核结构 (Exokernel)
            - 内核分配物理资源给多个应用程序
            - 让每个程序决定如何处理这些资源
            - 程序能链接到操作系统库 (libOS) 实现了操作系统抽象
            - 保护与控制分离
            - Distributed Shared Memory (DSM)

        - 虚拟机结构
            - 虚拟机管理器将单独的机器接口转换成很多的虚拟机
            - 每个虚拟机都是一个原始计算机系统的有效副本
            - 能完成所有的处理器指令

        - 应用程序运行与 OS 抽象 + 架构的关系
        - 说明了应用程序在不同操作系统架构中的运行方式与OS提供的环境和抽象的关系

    - 第五节 实践：试试UNIX/Linux
      - UNIX/Linux 系统介绍
          - 常见的Linux发行版
          - Ubuntu、Fedora、SuSE、openEuler
          - 麒麟、统信
          - 其他系统支持
          - Windows with WSL (Windows Subsystem for Linux)
          - MacOS with UNIX shell

      - UNIX/Linux的特点
          - 开放源码，有很好的文档，设计简洁，使用广泛
          - 对学习ucore/rcore内部情况有帮助

      - 尝试使用UNIX/Linux
          - Shell环境
          - bash: 基本的shell环境
          - fish: 强调交互性和可用性
          - zsh: 带有自动补全、支持插件
          - starship: 轻量、迅速、可无限定制
          - 常用程序
          - ls, rm，gcc，gdb, vim

      - UNIX/Linux提供的服务
          - 进程（正在运行的程序）
          - 内存分配
          - 文件内容、文件名、目录管理
          - 访问控制（安全）
          - 其他服务：用户、IPC、网络、时间

      - UNIX/Linux的应用/内核接口
          - 通过系统调用与内核交互
          - 示例: `fd = open("out", 1); write(fd, "hello\n", 6);`
          - 系统调用示例：
          - `int fork()` 创建一个进程，返回子进程的PID
          - `int exit(int status)` 终止当前进程；没有返回
          - `int wait(int *status)` 等待子进程退出；返回子进程的PID
          - `int kill(int pid)` 终止进程号为PID的进程；返回0或-1表示错误
          - `int getpid()` 返回当前进程的PID
          - 更多系统调用：`sleep`, `exec`, `sbrk`, `open`, `write`, `read`, `close`, `dup`, `pipe`, `chdir`, `mkdir`, `mknod`, `fstat`, `stat`, `link`, `unlink`

      - UNIX/Linux应用分析
          - 查看和分析简单小程序
          - 进程相关：fork.c, exec.c, forkexec.c
          - 文件系统相关：list.c, open.c, echo.c, copy.c
          - 进程间通信相关：pipe1.c, pipe2.c, redirect.c

## 第二讲 实践与实验介绍

- 第一节 实践与实验简要分析
  - [课程幻灯片列表](https://www.yuque.com/xyong-9fuoz/qczol5/ewvhdy3epbwbkn3n)

  - 提纲
  - 原理、实践与实验介绍
  - 循续渐进的操作系统实验
  - 实验安排

  - 操作系统需求逐渐增加
  - LibOS
  - 批处理OS
  - 多道程序与分时多任务OS

  - 逐步体现操作系统概念抽象
  - 地址空间抽象的OS
  - 进程抽象的OS
  - 文件抽象的OS

  - 逐步体现操作系统关键能力
  - 可进程间通信的OS
  - 可并发的OS
  - 管理I/O设备的OS

  - 具体操作系统类型和特点
  - LibOS
      - 远古操作系统雏形
      - 现代简单嵌入式操作系统
      - 相关知识点:
      - 以库的形式提供给应用程序的OS
      - 函数调用: 编译器与操作系统的配合
      - 硬件启动和软件启动
      - 编写/调试裸机程序

  - 批处理OS
      - 内存只驻留单道程序
      - 支持系统调用
      - 相关知识点:
      - 特权级/特权操作
      - RISC-V特权级/特权操作
      - 系统调用/异常
      - 加载&执行&切换应用程序
      - 特权级切换

  - 多道程序OS
      - 支持多个程序同时驻留内存
      - 支持多个程序依次执行
      - 相关知识点:
      - 内存空间划分与管理
      - 协作式调度

  - 分时多任务OS
      - 支持多个程序轮流执行
      - 相关知识点:
      - 中断处理
      - 上下文切换
      - 抢占式调度

  - OS的地址空间抽象
      - 支持程序间内存空间隔离
      - 超越物理内存的虚拟存储
      - 相关知识点:
      - 地址空间抽象
      - 静态内存分配
      - 动态内存分配
      - 页式存储管理
      - 局部性原理
      - 缺页异常
      - 虚拟页式存储
      - 置换算法

  - OS的进程抽象
      - 支持动态创建程序执行
      - 支持多处理器并行
      - 相关知识点:
      - 进程抽象
      - 进程管理
      - 调度机制
      - 多处理器/多核架构
      - 多处理器调度
      - 实际OS调度

  - OS的文件抽象
      - 处理数据的便捷持久存储
      - 相关知识点:
      - 文件抽象
      - 文件组织结构
      - 文件系统设计与实现

  - 实验安排
    - 实验一：操作系统的基本支持
        - 覆盖内容: LibOS、批处理OS、多道程序与分时多任务OS
        - 知识点：特权级和切换
    - 实验二：地址空间
        - 覆盖内容: 地址空间抽象的OS
        - 知识点：页表
    - 实验三：进程管理与调度
        - 覆盖内容: 进程抽象的OS
        - 知识点：进程控制块PCB
    - 实验四：文件系统与进程间通信
        - 覆盖内容: 文件抽象的OS、可进程间通信的OS
        - 知识点：文件
    - 实验五：同步互斥
        - 覆盖内容: 可并发的OS
        - 知识点: 线程
    - 扩展实验（即大实验，课程设计）
      - 4周内完成基础实验1~5后，与老师协商选择完成扩展实验来代替考试
      - 扩展组件化操作系统的crates/modules/frameworks
          - 实现新feature（多核、新外设、新处理器、新功能）的支持
          - 参加全国大学生OS比赛

- 第二节 Compiler与OS

  - 提纲
    - 硬件环境
    - 应用程序执行环境
    - 操作系统执行环境

  - 硬件环境
    - 开发的硬件环境 (x86 架构)
    - 目标硬件环境 (RISC-V 架构)

  - 应用程序执行环境
    - 编译器工作
      - 源码转换为汇编码
    - Assembler（汇编器）工作
      - 汇编码转换为机器码
    - Linker（链接器）工作
      - 多个机器码目标文件合并为单个机器码执行文件
    - OS工作
      - 加载/执行/管理机器码执行文件

  - 操作系统执行环境
    - Compiler/Assembler/Linker 工作流程
      - 从源码到汇编码，再到机器码，最后生成执行程序
      - Bootloader加载OS执行
    - 可执行文件格式
      - 三元组: CPU架构/厂商/操作系统
        - 示例: riscv32gc-unknown-linux-gnu, riscv64gc-unknown-none-elf
        - ELF: Executable and Linkable Format
    - 链接和执行过程展示
    - 函数库
      - 标准库 (依赖操作系统)
        - Rust: std 标准库
        - C：glibc, musl libc 
      - 核心库 (与操作系统无关)
        - Rust: core 核心库
        - C: Linux/BSD kernel libc
    - 裸机程序
      - 定义: 与操作系统无关的OS类型的程序 (Bare Metal program)
      - 示例代码及配置
    - ELF文件格式和文件头信息
      - 文件格式详情
      - 反汇编导出汇编程序指令
      - 主要段和内存布局
        - .text: 代码段
        - .rodata: 已初始化数据段，只读
        - .data: 可修改的全局数据
        - .bss: 未初始化数据段
        - 堆 (heap) 向高地址增长
        - 栈 (stack) 向低地址增长

- 第三节 硬件启动与软件启动

  - 提纲
    - RISC-V开发板
    - QEMU启动参数和流程
    - x86启动流程

  - RISC-V开发板
    - K210开发板
      - 基于RISC-V 64多核处理器
    - 哪吒D1开发板
      - 基于RISC-V 64单核处理器
    - HiFive Unmatched 开发板（U740）
      - 基于RISC-V 64多核处理器

  - QEMU启动参数和流程
    - QEMU模拟器
      - 模拟一台64位RISC-V架构的计算机
        - 包含一个或多个CPU
        - 物理内存
        - 若干I/O外设
    - QEMU启动参数
      - 启动配置示例
        ```
        qemu-system-riscv64 \
            -machine virt \
            -nographic \
            -bios ../bootloader/rustsbi-qemu.bin \
            -device loader,file=target/riscv64gc-unknown-none-elf/release/os.bin,addr=0x80200000
        ```
        - machine virt: 设置为名为virt的虚拟机
        - nographic: 不使用图形界面，只输出字符流
        - bios: 设置引导加载程序
        - device loader: 载入文件到指定的物理内存地址
    - QEMU启动流程
      - 启动阶段划分
        1. 固化在QEMU模拟计算机内存中的汇编程序初始化并执行bootloader
        2. Bootloader初始化并加载OS
        3. OS内核执行初始化工作

  - x86启动流程
    - 真实计算机(x86)的启动流程
      1. Rom Stage: 在ROM上运行BIOS代码
      2. Ram Stage: 在RAM上运行代码，检测并初始化芯片组、主板等
      3. Bootloader Stage: 在存储设备上找到Bootloader并加载执行
      4. OS Stage: Bootloader初始化外设，在存储设备上找到OS并加载执行

- 第四节 实践：裸机程序 -- LibOS

  - 提纲
    - 实验目标和思路
    - 实验要求
    - 实践步骤
    - 代码结构
    - 内存布局
    - 基于 GDB 验证启动流程
    - 函数调用
    - LibOS初始化
    - SBI调用

  - LibOS的实验目标
    - 概念：裸机程序（Bare Metal Program）
      - 与操作系统无关的OS类型的程序
    - 功能：
      - 建立应用程序的执行环境
        - 让应用与硬件隔离
        - 简化应用访问硬件的难度和复杂性
      - 提供执行环境（Execution Environment）

  - LibOS历史背景
    - 1949-1951年，J. Lyons and Co. 引入EDSAC计算机，联合设计LEO I系统
    - 子程序概念的引入
      - David Wheeler 发明子程序概念 – Wheeler Jump
      - 子程序库形成了最早的操作系统原型

  - LibOS总体思路
    - 编译：设置编译器支持裸机程序
    - 构造：建立栈和SBI服务请求接口
    - 运行：OS的起始地址和执行环境初始化

  - 实验要求
    - 理解LibOS的执行过程
      - 编写、编译、运行裸机程序
      - 懂得基于裸机程序的函数调用
      - 能看懂汇编代码伪代码和内嵌汇编代码
      - 初步理解SBI调用

  - 实践步骤
    - 开发与实验环境准备
    - 移除标准库依赖
    - 支持函数调用
    - 基于SBI服务完成输出与关机
    - 理解程序的内存空间和栈

  - 代码结构
    - os/src: 主要代码目录
      - console.rs: 格式化输出实现
      - entry.asm: 设置执行环境的汇编代码
      - lang_items.rs: 包含panic处理逻辑
      - linker-qemu.ld: 控制内核内存布局的链接脚本
      - main.rs: 内核主函数
      - sbi.rs: 调用底层SBI实现提供的接口

  - 内存布局
    - .text: 代码段
    - .rodata: 已初始化数据段，只读
    - .data: 可修改的全局数据
    - .bss: 未初始化数据段
    - 堆 (heap) 向高地址增长
    - 栈 (stack) 向低地址增长

  - 基于 GDB 验证启动流程
    - 使用GDB连接至QEMU进行调试
    - 分析加载和执行流程

  - 函数调用
    - ABI 和 SBI 接口详解
    - 函数调用、返回和寄存器使用约定
    - 栈帧的管理和使用

  - LibOS初始化
    - 从ASM到Rust的控制权转交
    - 清空bss段以初始化未分配的全局变量

  - SBI调用
    - SBI服务接
    - SBI服务接口
    - SBI服务编号
    -  汇编级SBI调用
    -  SBI调用：输出字符
    -   SBI调用：关机
    -  优雅地处理错误panic
    -  LibOS完整功能