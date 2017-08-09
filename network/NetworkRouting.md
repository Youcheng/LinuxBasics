vlan
----
virutal local area network
OSI-model layer 2

router
------
move traffic between networks


vlan-enabled switch
-------------------
```
there is a only one default vlan on a new switch until more vlans are configured
```

- top switch
  - port 1, vlan 10, each port has to be on a specific vlan
  - port 2, vlan 20
- trunk link
  a physical cable to carry all vlan traffic between switches
- bottom switch
  - port 1
  - port 2, vlan 10
  - port 3, vlan 20
  
![VLAN-across-switches](https://github.com/Youcheng/LinuxBasics/blob/master/pictures/VLAN-across-switches.png)



IEEE 802.1q protocol
--------------------
trunking protocol which allows vlan information to be shared between switches


DHCP
----
Dynamic host configuration protocol
It is used by the DHCP server to assign an IP to a machine which requests for it.
Meanwhiles, DHCP server could also reserve some IPS for some specific machines.
The process a machine getting a dynamic IP is DORA, discover--offer-acknowledge-request, as following
![DORA](https://github.com/Youcheng/LinuxBasics/blob/master/pictures/DORA.png)


