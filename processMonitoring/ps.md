ps
--
    The ps command has three different types of syntax options: Unix, BSD, and GNU.
    
    The Unix options looks as you'd expect with a dash before a single letter.
    The GNU options are words with two dashes just like other commands. 
    The odd ones are the BSD options which don't have any dashes at all.


show selected and sorted fields
-------------------------------
* ps -e --format uid,pid,ppid,%cpu,rss,cmd --sort %cpu (rss-memory usage, %cpu-cpu usage)



show all threads for a paticular application
--------------------------------------------
[05:35 AM root@zc-dc3-red02 ~ ]# ps -p 131298 -L  
   PID    LWP TTY          TIME CMD
131298 131298 ?        00:00:32 main_algo_serve
131298 131325 ?        00:07:38 log_thread
131298 131326 ?        00:00:47 play_srv_comm
131298 131327 ?        00:00:08 md_snapshots
131298 131328 ?        09:57:23 realtm_feed_han