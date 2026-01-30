# 💻 Immutable Distro

📎 digital-security 📎 linux 📎 operating-system

`Immutable` `Linux` operating systems offer enhanced security and reliability compared to traditional `Linux` systems, making them ideal for environments where security is a priority;

- upgrades in these systems are handled through image-based updates,
- ensuring system integrity
- preventing unauthorized modifications.

<https://kairos.io/blog/2023/03/22/understanding-immutable-linux-os-benefits-architecture-and-challenges/>

!!! quote "quote from article"

    Formally defined, an immutable Linux OS (also known as Immutable Infrastructure or Immutable Deployment) is an operating system designed to be unchangeable and read-only. This means that once the operating system has been installed, the system files and directories cannot be modified. Any changes made to the system are temporary and lost when the system is rebooted. Think of it as a snapshot of a standard Linux system that cannot be changed. Any updates or changes are made by creating a new instance of the OS, deploying it, and switching over to the new instance. You can also find a very good writeup by Adrian Hornsby here.

    If you’re already a Linux user, you’ll know that as root (Administrator), you can write anywhere in the filesystem, potentially corrupting the OS portion responsible for booting or management. In an immutable OS, however, any command that attempts to modify the system files will fail, as those files are only accessible for reading.
