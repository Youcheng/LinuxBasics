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
* $ \[\[ 20 -gt 100 ]] (integer comparison)
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


working with array
------------------
* $ a=() (arrary is 0 based)
* $ b=("apple" "cherry")
* $ echo ${b[2]}
* $ b[3]="kiwi"
* $ b+=("get") (append one element in the end of the array)
* $ echo ${b[@]} (display the whole array)
* $ echo ${b[@]: -1} (display the last element)
* $ declare -A myarray; myarray["home adress"]="pudong shanghai" (assosiative array, key-value)


read/write text files
---------------------
* $ echo "bla bla" > file.txt (overwrite to a file)
* $ echo "bla bla" >> file.txt (append to a file)
* $ > file.txt (zero out a file)
* read a file
---
    i=1
    while read f; 
    do
      echo "Line $i: $f"
      ((i++))
    done < file.txt


here document
-------------
    # specify input freely up to a specified limit string.
    cat << EndOf
    this is
    goore
    or not
    EndOf

if/else statement
-----------------
    if expression; then
      doSth
    else
      doSth
    fi 

    if expression; then
      doSth
    elif expression2; then
      doSth
    fi     
 
    
while and until loops
---------------------
    while expression; 
    do
      doSth
    done      
    
    until expression; 
    do 
      doSth
    done
    
for loop
--------
    for i in 1 2 3
    do
      doSth
    done  
    
    for (( i=1; i<=10; i++ ))
    do
      doSth
    done  
    
    arr=("apple" "orange")
    for i in ${arr[@]}
    do
      doSth
    done  
    
    declare -A arr
    arr["name"]="john"
    arr["id"]="234e32"
    for i in "${!arr[@]}"
    do 
      echo "$i: ${arr[i]}"
    done  
    
    for i in $(ls)
    do
      echo $i
    done
    
case
----
    a="dog"
    case $a in
      cat) echo "xx";;
      dog|puppy) echo "yy";;
      *) echo "no match";;
    esac  
  
      