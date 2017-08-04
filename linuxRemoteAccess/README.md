remote access protocol
======================

Remote Desktop Protocols
------------------------
- VNC
- RDP
- NX

Remote CLI Protocols
--------------------
- SSH
- Rlogin
- Telnet


VNC(Virtual Network Computing)
------------------------------
- how it works
```
 Its is based on the concept of a remote framebuffer.
 This let' the VNC sever on the host update the framebuffer on the client remotely.
 Since it's effectively taking a picture of the server's desktop,
 and updating the copy on a window on the client,
 it's very easy to implement from a programming standpoint.
 When the client's mouse or keyboard creates an event,
 the client signals the server to update the framebuffer,
 which updates the client's view of the desktop.
```

- server-client
![VNCServerClient](https://github.com/Youcheng/ServerTuning/blob/master/LinuxBasics/pictures/VNCServerClient.png)

- softwares on server side
    VNC Server
    - [TigerVNC](http://tigervnc.org/)
    yum install tigervnc-server
    - configuration
```
#1 copy example config file in place
   sudo cp /usr/lib/systemd/system/vncserver\@.service /etc/systemd/system/vncserver-youcheng@.service

#2 modify the config file
   USER->linuxuser

#3 set up password for vnc login( we have to be logging in as the same linuxuser as above to set up password)
   vncpasswd

#4 start vnc server
   sudo systemctl daemon-reload
   sudo systemctl start vncserver-linuxuser@:1.service

   (this will use 5901 port by default, if you want to have a second vnc login,
   you will have to sudo systemctl start vncserver-linuxuser@:2.service, which will use port 5902)

#5 config firewall rules if firewall is enabled
   sudo systemctl start firewalld
   sudo firewalld-cmd --permanent --zone=public --add-port=5901/tcp
   sudo firewalld-cmd --reload

#6 find out the ip of vnc server machine



   The reason we're naming our configuration file is that we need a separate configuration
   for each user. We need one vnc server configuration file per user login.
```

- softwares on client side
    VNC Viewer
    - [RealVNC](https://www.realvnc.com/en/download/vnc/)

```
#1 run vncviewer from the command line
./vncviewer

#2
10.31.30.5:5901
```
![vncviewer](https://github.com/Youcheng/ServerTuning/blob/master/LinuxBasics/pictures/vncviewer.png)

