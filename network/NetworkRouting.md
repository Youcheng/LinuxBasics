vlan
----
virutal local area network
OSI-model layer 2

router
------
move traffic between networks


vlan-enabled switch
-------------------
- top switch
  - port 1, vlan 10
  - port 2, vlan 20
- trunk link
  a physical cable to carry all vlan traffic between switches
- bottom switch
  - port 1
  - port 2, vlan 10
  - port 3, vlan 20
  
![VLAN-across-switches](https://github.com/Youcheng/LinuxBasics/blob/master/pictures/VLAN-across-switches.png)






IEEE 802.1q protocl
-------------------
truncing protocol which allows vlan information to be shared between switches
