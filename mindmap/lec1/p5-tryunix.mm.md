### 第五节 实践：试试UNIX/Linux
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

