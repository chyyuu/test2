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

