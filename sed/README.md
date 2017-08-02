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
Affect every occurence on a line.

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

more sed commands
-----------------
- **p** prints the specified line(s)
- **d** deletes the specified line(s)
- **r** reads a file at the specified line
- **w** writes the specified line(s) to a file
- **y** transforms characters

address precedes the command
----------------------------
to specify certain line(s) to process rather than every line
- sed '3s/up/UP/' file <- only work on line 3
- sed '2,4s/up/UP/' file <- only work on line 2 to 4
- sed '$s/up/UP/' file <- only work on last line
- sed -n '/down/p' file <- only print lines which match regular expression, down
- sed -n '/march/,/when/p' file <- file from first line which matches regular expression, march to the first line which matches regular expression, when
- sed '/up/!d' file <- delete lines which doesn't contain regular expression, up
- sed '2,4!d' file <- delete every line except line 2 to 4

