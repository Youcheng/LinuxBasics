bash
----
* bourne again shell
* a popular interactive command line interpreter

tilde and brace expansion
-------------------------
* $ cd ~
* $ echo {1..10..2}

redirect
--------
* $ command 1>output.txt 2>error.txt


built-in variables
------------------
* $ echo $HOME $PWD $MACHTYPE $BASH_VERSION $SECONDS $0
* http://tldp.org/LDP/abs/html/internalvariables.html

command substitution
--------------------
* $ d=$(PWD)

arithmetic operations
---------------------
* $ ((e+=5))
* $ ((e++))
* $ val=$((1/3))  (integer division)
* $ val=$(echo 1/3 |  bc -l) (floating point division)

comparison operations
---------------------
* $ \[\[ $a < $b ]] (0: TRUE, 1: FALSE)
* $ \[\[ 20 > 100 ]] (string comparison)
* $ \[\[ 20 -gt 100 ]] (number comparison)
* $ \[\[ -z $a ]] (is null?)
* $ \[\[ -n $a ]] (is not null?)

string manipulation
-------------------
* $ c=$a$b (concatenation)
* $ d=${c:3:4} (substring starting with index 3 and 4 consecutive chars)
* $ d=${c: -3:4} (substring from end of the string)
* $ d=${varName/x/y} (replace the first instance of x with y in varName)
* $ d=${varName//x/y} (replace all instances of x with y in varName)
* $ d=${varName/#x/y} (replace instances of x with y in varName if x is at the beginning)
* $ d=${varName/%x/y} (replace all instances of x with y in varName if x is at the end)


coloring and styling text
-------------------------
    style text in bash to draw attention to specific things or 
    make output more interesting
![coloredText](https://github.com/Youcheng/LinuxBasics/blob/master/pictures/coloredText.png)
![coloredExample](https://github.com/Youcheng/LinuxBasics/blob/master/pictures/coloredExample.png)
![styledText](https://github.com/Youcheng/LinuxBasics/blob/master/pictures/styledText.png)
* echo -e '**\033[34;42m** Color Text **\033[0m**'    (echo with escaping, 34-foreground=blue, 42-background=green, m=end)
