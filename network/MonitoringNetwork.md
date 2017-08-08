Check network path
------------------
tracepath

Monitor network with ip
-----------------------
```
- mac address
- RX/TX statistics

    [gui  (master)]$ ip -s link show enp5s0
    2: enp5s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP mode DEFAULT qlen 1000
        **link/ether 0c:c4:7a:6d:0d:24 brd** ff:ff:ff:ff:ff:ff
        RX: bytes  packets  errors  dropped overrun mcast
        4137358203 7272056  0       0       0       26793
        TX: bytes  packets  errors  dropped carrier collsns
        727263218  5242022  0       0       0       0
```

Using netstat
-------------

```
- tln, t, tcp, l, listening, n, show port number

[gui  (master)]$ netstat -tln
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 127.0.0.1:63342         0.0.0.0:*               LISTEN
tcp        0      0 0.0.0.0:111             0.0.0.0:*               LISTEN
tcp        0      0 192.168.122.1:53        0.0.0.0:*               LISTEN
tcp        0      0 127.0.0.1:8886          0.0.0.0:*               LISTEN
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN
tcp        0      0 0.0.0.0:631             0.0.0.0:*               LISTEN
tcp        0      0 127.0.0.1:25            0.0.0.0:*               LISTEN
```

```
    [gui  (master)]$ netstat -i
    Kernel Interface table
    Iface      MTU    RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
    enp0s20u  1500        0      0      0 0             0      0      0      0 BMU
    enp5s0    1500  7282785      0      0 0       5248763      0      0      0 BMRU
    enp6s0    1500        0      0      0 0             0      0      0      0 BMU
    lo       65536    16690      0      0 0         16690      0      0      0 LRU
    virbr0    1500        0      0      0 0             0      0      0      0 BMU
```


Reading network statistics with sysstat
---------------------------------------
```
- crontab
    [11:37 PM root@cr-pvg-dev002 sed ]# cat /etc/cron.d/sysstat
    # Run system activity accounting tool every 10 minutes
    */10 * * * * root /usr/lib64/sa/sa1 1 1
    # 0 * * * * root /usr/lib64/sa/sa1 600 6 &
    # Generate a daily summary of process accounting at 23:53
    53 23 * * * root /usr/lib64/sa/sa2 -A

 - binary log
    [11:39 PM root@cr-pvg-dev002 sed ]# ls /var/log/sa/sa
    sa01   sa05   sa10   sa14   sa18   sa22   sa26   sa30   sar03  sar08  sar12  sar16  sar20  sar24  sar28
    sa02   sa06   sa11   sa15   sa19   sa23   sa27   sa31   sar04  sar09  sar13  sar17  sar21  sar25  sar29
    sa03   sa07   sa12   sa16   sa20   sa24   sa28   sar01  sar05  sar10  sar14  sar18  sar22  sar26  sar30
    sa04   sa09   sa13   sa17   sa21   sa25   sa29   sar02  sar06  sar11  sar15  sar19  sar23  sar27  sar31

- read binayr log
    [11:44 PM root@cr-pvg-dev002 sed ]# sar -n DEV
    Linux 3.10.0-514.el7.x86_64 (cr-pvg-dev002) 	08/07/2017 	_x86_64_	(24 CPU)

    12:00:02 AM     IFACE   rxpck/s   txpck/s    rxkB/s    txkB/s   rxcmp/s   txcmp/s  rxmcst/s
    12:10:02 AM        lo      0.01      0.01      0.00      0.00      0.00      0.00      0.00
    12:10:02 AM virbr0-nic      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    12:10:02 AM    virbr0      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    12:10:02 AM    enp5s0      3.83      2.94      0.55      0.47      0.00      0.00      0.00
    12:10:02 AM    enp6s0      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    12:20:01 AM        lo      0.01      0.01      0.00      0.00      0.00      0.00      0.00
    12:20:01 AM virbr0-nic      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    12:20:01 AM    virbr0      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    12:20:01 AM    enp5s0      4.02      3.36      0.58      0.51      0.00      0.00      0.00
    12:20:01 AM    enp6s0      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    12:30:02 AM        lo      0.01      0.01      0.00      0.00      0.00      0.00      0.00
    12:30:02 AM virbr0-nic      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    12:30:02 AM    virbr0      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    12:30:02 AM    enp5s0      3.89      3.06      0.58      0.49      0.00      0.00      0.01
    12:30:02 AM    enp6s0      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    12:40:02 AM        lo      0.01      0.01      0.00      0.00      0.00      0.00      0.00
```