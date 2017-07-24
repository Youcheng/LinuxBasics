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
  
function
--------
    function greet {
      echo "hello"
      }
    greet
    
    function greet2 {
      echo "hello, $1"
      }
    greet2 name    
    
    function printAllArguments {
      i=1
      for f in $@; do
        echo $i : $f
        ((i+=1))
      done
    }     
    printAllArguments $(ls) 
    
    
work with arguments from cli
----------------------------
    $@, an array of arguments
    $#, number of arguments

    for f in $@; do  
      echo $i : $f
      ((i+=1))
    done  
    
work with flags from cli
------------------------
    while getopts :u:p:a option; do
      case $option in
        u) user=$OPTARG;; # u:
        p) pass=$OPTARG;; # p:
        a) echo "got -a flag and no value";; # last a without colon following
        ?) echo "not sure what $OPTARG means";; # leading colon for any unspecified flag
      esac
    done
    
    echo "user: $user / pass: $pass" 

get input during execution
--------------------------
    echo "your name?"
    read name
    
    echo "your password?"
    read -s name       #-s silent         
    
    read -p "you pet?" animal      #-p write an prompt before input area
    
    select option in "cat" "dog" "quit"
    do
      case $option in
        cat) echo "You selected cat";;
        dog) echo "You selected dog";;
        quit) break;;
        *) echo "we don't have this option";;
      esac
    done

input validation
----------------
    if [ $# -lt 3 ]; then
            cat <<- EOM
            This command requires three arguments;
            user, userid, and number.
            EOM
    else
            echo "user: $1"
            echo "userid: $2"
            echo "number: $3"
    fi    
    
    
    read -p "favorite animal?" a
    while [[-z "$a"]]; do
      read -p "pls give an answer" a
    done
    echo "favorite animal: $a"  
    
    
    read -p "what year? [yyyy]" a
    while [[ ! $a =~ [0-9]{4} ]]; do
      read -p "A year is four digits, [yyyy]" a
    done
    echo "input year $a"                        