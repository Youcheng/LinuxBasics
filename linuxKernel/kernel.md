linux kernel
------------
    It is a program like
    
    [08:50 PM root@cr-pvg-dev002 yum.repos.d ]# ll /boot/vmlinuz-3.10.0-514.el7.x86_64 
    -rwxr-xr-x. 1 root root 5.2M Nov 22  2016 /boot/vmlinuz-3.10.0-514.el7.x86_64

bootloader
----------    
    It needs to be loaded by a bootloader, like GRUB.
    GRUB reads the kernel file from disk into memory, and will transfer control to it.
 
kernel command line parameters
------------------------------    
    The kernel program, like other programs, has command-line parameters, 
    and GRUB is responsible for passing those parameters to the kernel. 

system call
-----------    
    The Linux kernel is an API. It provides a programming interface. 
    The functions that we can call from user space into the kernel we call system calls.
    They are functions implemented by the kernel and meant to be called from user space.
    Application" doesn't call a system call directly, as it turns out. 
    Applications call library functions, and the system calls from C are in the standard C library(libc).
    
    [09:10 PM root@cr-pvg-dev002 include ]# ll unistd.h 
    -rw-r--r--. 1 root root 42K May 25 10:43 unistd.h
 
    When the system call returns, it's gonna return back to the library. 
    And the protocol is for the system call to return a negative value, 
    with the absolute value of that indicating what error there was. 
    If there's not an error, then it returns zero or a positive number.
    
    If the kernel returns a negative value to the library, 
    then the library sets what's effectively a global variable in your process, called "errno",
    to represent what error there was. And then the library returns "minus one" to the application. 
    So applications calling system calls get back "minus one" from the library, 
    and errno is set to represent what error there was.
    
    // the systemcall is in the section 2 of man page
    [09:24 PM root@cr-pvg-dev002 include ]# man 2 read
    
![applicationKernel](https://github.com/Youcheng/ServerTuning/blob/master/LinuxBasics/pictures/applicationKernel.png)
        
reading messages from the kernel
--------------------------------
    dmesg
    shows RAM buffer messages from the kernel.
    The RAM buffer though is limited size, so if your system's been up for a while.
    
virtual file system
-------------------
    /proc
    /sys
    /dev
    
    Linux kernel also provides virtual file systems, proc and sys and the lesser-known debugfs, 
    and through those virtual file systems, we can interact directly with the kernel, 
    getting information from the kernel, and changing things in the kernel.
    
    Virtual Filesystems that we talked about proc and sysfs that means these virtual filesystems don't store their contents on a disk, 
    more accurately they generate their contents when you ask for it. 
    When you cat a file in proc or sys, there's some corresponding function in the kernel that's called to generate the contents. 
    These are not RAM-based filesystems. RAM filesystems store their contents in RAM. 
    Virtual filesystems generate their contents when you ask for it, like callback functions.
 
    It's a snapshot. It might already be different by the time you had a chance to read it on your screen, 
    but it was the latest information at the time you asked for it.


kernel tunable variables
------------------------
    /proc/sys/*    
   
    
