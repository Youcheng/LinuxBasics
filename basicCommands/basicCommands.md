redhat or centos
================

get help on command
-------------------
* $ command --help
* $ help command
* $ info command
* $ man command
manual category
* $ man man-pages
* $ man 1 intro
* $ man -f command (this command could be in different man-page category)


get OS information
------------------
* $ yum install redhat-lsb-core
* $ hostnamectl
* $ uname -a (kernel information)
* $ dmesg -H (messages from kernel)
* $ free -m
* $ cat /proc/meminfo
* $ yum install gnome-system-monitor (graphical tool, Application->System Tools->System Monitor)

get hardware information
------------------------
* $ dmidecode
* $ dmidecode --type bios
* $ lsusb
* $ lspci
* $ lscpu
* $ cat /proc/cpuinfo
* $ lsblk (hard disks)


date and time
-------------
* $ timedatectl
* $ timedatectl list-timezones
* $ timedatectl set-timezone America/Vancouver
* $ timedatectl set-time 23:26:00
* $ timedatectl set-time 2017-09-20
* $ timedatectl set-time '2017-09-20 23:26:00'
* $ yum install chrony (install ntp client)
* $ timedatectl set-ntp true (restart ntp client: $ systemctl restart systemd-timedated) 

locale and date
---------------
* $ localectl
* $ localectl list-locales
* $ localectl list-keymaps
* $ date +"%h %d %Y"


archive and compress files
--------------------------
    In Linux, we use an archiver to preserve metadata such as ownership, 
    permissions, access control lists, as well as the file data itself.
    In Linux, we use an archiver to preserve metadata 
    such as ownership, permissions, access control lists, 
    as well as the file data itself. The tool we usually use is tar, or Tape Archiver. 
    Tar itself doesn't compress files but leaves that job up to compression tools. 
* $ tar --xattrs -cvpf etc.tar /etc<br>
    xattrs preserves extended attributes, including access control lists and SELinux security contexts.<br>
    c to create an archive, v for verbose, p to save ownership and permissions, and then f for the final name of the archive
* $ tar --gzip(bzip2 or xz) --xattrs -cvpf etc.tar.gzip(.bz2 or .xz) /etc <br> 
* tar -tf etc.tar(list all files in an archive)
* tar --gzip -tf etc.tar(list all files in a compressed archive)    
* tar --xattrs -xvpf etc.tar -C newDirectory (extract archive)


navigate file system
--------------------
* $ tree
* $ file fileName
* $ locate fileName (find fileName in the locate database)
* $ locate -c fileName (couting files containing fileName in the string)
* $ locate fileName1 fileNam2 (find "OR")
* $ locate -A fileName1 fileNam2 (find "AND")
* $ locate -i fileName1(case insensitive)
* $ locate --regexp 'xxx' 
* $ locate -S (find the information in the database)
* $ updatedb (manually update database)

filesystem hierarchy
--------------------
    /proc is an interesting one. It's a virtual filesystem, meaning the files in it do not really exist on the disc.
    The kernel creates them on the fly, and they contain system information or process information.

![fileSystemHierarchy](https://github.com/Youcheng/LinuxBasics/blob/master/pictures/fileSystemHierarchy.png)
![fileSystemHierarchy2](https://github.com/Youcheng/LinuxBasics/blob/master/pictures/fileSystemHierarchy2.png)