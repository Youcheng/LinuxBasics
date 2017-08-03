sed
---
stream editor for filtering and transforming text


sed is good for
---------------
- simple manipulations on line-oriented text files
- can be used on command line
- can also write complex sed programs


sed is not good for
-------------------
- not useful for binary data


sed 's/old/new/' file, the seperator doesn't have to be slash, which can be any char
------------------------------------------------------------------------------------
This replaces the first occurrence of the word "old" on each line of the file with the word "new."
- **sed** invokes the sed program
- **s** specifies sed's substitute command
- **s** command is quoted in single quotes in case it contains sepecial chars
- **old** is a regular expression
- **new** is NOT a regular expression
- doesn't change the original file, -i will change the file in place

sed 's/old/new/g' file
----------------------
Affect every occurence for every line.

sed 's/old/new/3' file
----------------------
Affect 3rd occurence on a line.

regular expression
------------------
Defines a pattern which strings are said to match or not to. It is case sensitive.

- meta char
    - . (period) matches any single char
    - \\ (backslash) removes special meaning of a meta char
    - ^ (caret) and $(dollar sign) match line begin and end
    - \[] (square bracket) match any string in which it has one char from the set in square bracket
    - \ [^] not from the set
    - \* (asterisk) match zero or more occurences of previous item
    - () repats  multiple items

special replacement string for new
----------------------------------
- **&** (ampersand) is replaced with found text
- **\n** (back slash with a number) is replaced with the text found for the nth


sed command-line flags
----------------------
- **-n** suppresses default print of each line
- **-e** allows specifying multiple commands
    - sed -e 's/up/UP/' -e 's/down/DOWN/' file
- **-f** specifies a sed script to run
    - sed -f script.txt file.txt

address precedes the command
----------------------------
to specify certain line(s) to process rather than every line

more sed commands
=================

**s** command substitue
-----------------------
- sed '3s/up/UP/' file <- only work on line 3
- sed '2,4s/up/UP/' file <- only work on line 2 to 4
- sed '$s/up/UP/' file <- only work on last line

**p** command, prints the specified line(s)
------------------------------------
- sed -n '/down/p' file <- only print lines which match regular expression, down
- sed -n '/march/,/when/p' file <- file from first line which matches regular expression, march to the first line which matches regular expression, when

**d** command, deletes the specified line(s)
-------------------------------------
- sed '/up/!d' file <- delete lines which doesn't contain regular expression, up
- sed '2,4!d' file <- delete every line except line 2 to 4

**r** command, reads a file after the specified line
---------------------------------------------
- sed 'down/r new.txt' file.txt 
- sed '3r new.txt' file.txt
- sed '$r new.txt' file.txt . <- end of the line


**w** command, writes the specified line(s) to a file
----------------------------------------------
- sed '1,3w new.txt' file.txt
- sed 's/up/UP/gw up.txt' file.txt <- modify lines first and save those files to up.txt

**y** command, replace each char accordingly
-----------------------------------
- sed 'y/abc/ABC' file.txt <- replace a with A, b with B, c with C

**a** command, append line(s) after sepcified line
-------------------------------------------------
- sed '/down/a\{Enter}
  newline1\{Enter}
  newline2{Enter}
  ' file.txt
- Alternatively to create a script and execute it
```
  cat > script{Enter}
  /down/ a\{Enter}
  newline1\{Enter}
  newline2{Enter}
  /up/ a\{Enter}
  newline3\{Enter}
  newline4
```
```
  sed -f script file.txt{Enter}
```  
**i** command, insert line(s) before sepcified line  
------------------------------------------

**c** command, replace specified line with line(s)  
------------------------------------------
```
sed '/top/,/again/ c\{Enter}
newline1\{Enter}
newline2{Enter}
' file.txt

subsite lines from the line cointaining top to line containing again
with two lines
```

write programs in sed(group more commands in a file to be executed by sed)
==========================================================================
sed -f script file.txt
```
for lines(2-4) containing when we will do the two substitution

cat > script
/when/ {
  2,4 {
    s/up/UP/g
    s/down/DOWN/g
  }  
}  
```

more commands to be used in the script
-------------------------------------
- n command, getting next line
- q command, exit the program
- d command, exit current line
- = command, print the line number which is executed
- l command, to display the non-printing char unambiguously for the s sommand
- # is for command
