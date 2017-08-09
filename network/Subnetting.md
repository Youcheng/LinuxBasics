default gateway
---------------
It will receive a packet from a machine if this machine wants to send to this packet 
to a different network than where this machine is located.


subnet mask
-----------
a mask is used to concel your identity.
but in subnet mask, the "mask" here is to reveal something, which is the network id.
192.168.1.0/255.255.255.0 or 192.168.1.0/24

subnet ipv4 address
-------------------
```
  borrow one bit to do subnetting
  1111 1111.1111 1111.1111 1111.0000(old mask)

  1111 1111.1111 1111.1111 1111.1000(new mask1)-> new subnet 1
  1111 1111.1111 1111.1111 1111.0000(new mask2)-> new subnet 2

  new subnet 1 ip range: 1111 1111.1111 1111.1111 1111.1000->1111 1111.1111 1111.1111 1111.1111
    which is 192.168.1.128(left edge)->192.168.1.255(right edge), the addresses we could use to assign is from 
    192.168.1.129 to 192.168.1.254 because 192.168.1.255 is the local broadcast address

  new subnet 2 ip range: 1111 1111.1111 1111.1111 1111.0000->1111 1111.1111 1111.1111 1111.0111
    which is 192.168.1.0(left edge)->192.168.1.127(right edge), the addresses we could use to assign is from 
    192.168.1.1 to 192.168.1.126 because 192.168.1.127 is the local broadcast address
```  
