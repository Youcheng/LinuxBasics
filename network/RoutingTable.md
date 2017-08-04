how to read routing table
-------------------------

```
[05:08 AM root@localhost ~ ]# ip route show
    default via 10.198.1.1 dev eth0
    10.30.60.36/30 dev eth3  proto kernel  scope link  src 10.30.60.38
    10.198.1.0/24 dev eth0  proto kernel  scope link  src 10.198.1.53
    10.198.254.8/29 dev eth2.4093  proto kernel  scope link  src 10.198.254.12
    169.254.0.0/16 dev eth2  scope link  metric 1002
    169.254.0.0/16 dev eth0  scope link  metric 1003
    169.254.0.0/16 dev eth3  scope link  metric 1004
    169.254.0.0/16 dev eth4  scope link  metric 1005
    169.254.0.0/16 dev eth2.4093  scope link  metric 1008
    172.17.49.72/29 dev eth4  proto kernel  scope link  src 172.17.49.74
    205.209.0.0/16 via 10.30.60.37 dev eth3
    224.0.31.0/24 via 10.30.60.37 dev eth3
    224.0.32.0/24 via 172.17.49.73 dev eth4
    224.0.33.0/24 via 10.30.60.37 dev eth3
    224.0.34.0/24 via 172.17.49.73 dev eth4
```

- Destinations in the same network as the host
```
    10.30.60.36/30 dev eth3  proto kernel  scope link  src 10.30.60.38
    10.198.1.0/24 dev eth0  proto kernel  scope link  src 10.198.1.53
    10.198.254.8/29 dev eth2.4093  proto kernel  scope link  src 10.198.254.12
    169.254.0.0/16 dev eth2  scope link  metric 1002
    169.254.0.0/16 dev eth0  scope link  metric 1003
    169.254.0.0/16 dev eth3  scope link  metric 1004
    169.254.0.0/16 dev eth4  scope link  metric 1005
    169.254.0.0/16 dev eth2.4093  scope link  metric 1008

    172.17.49.72/29 dev eth4  proto kernel  scope link  src 172.17.49.74
    Destination(172.17.49.72/29) <-> NetworkInterface(eth4, 172.17.49.74)
```

- Destinations in different networks than the host
```
    default via 10.198.1.1 dev eth0
    205.209.0.0/16 via 10.30.60.37 dev eth3
    224.0.31.0/24 via 10.30.60.37 dev eth3
    224.0.32.0/24 via 172.17.49.73 dev eth4
    224.0.33.0/24 via 10.30.60.37 dev eth3

    224.0.34.0/24 via 172.17.49.73 dev eth4
    Destination(224.0.34.0/24) <-> Router(172.17.49.73) <-> NetworkInterface(eth4)

    Explanation of 224.0.34.0/24
    It repsents a set of IPs from a network.
    224.0.34.0 -> binary format 11100000.00000000.00100010.00000000

    Network ID:
        the first 24 digits, where is 11100000.00000000.00100010, decimal format, 224.0.34
    The set of IPs:
        which are [11100000.00000000.00100010.00000000, 11100000.00000000.00100010.11111111]
        in decimal formats, [224.0.34.0, 224.0.34.255]
```


how to add a static routing path
--------------------------------
```
command to add
    [05:40 AM root@localhost sed ]# ip route add 195.188.199.0/24 dev virbr0

output after add
    [05:40 AM root@localhost sed ]# ip route show
    ...
    195.188.199.0/24 dev virbr0  scope link

reload setting
        [05:40 AM root@localhost sed ]# service network restart

command to delete
        [05:46 AM root@cr-pvg-dev002 sed ]# ip route del 195.188.199.0/24
```