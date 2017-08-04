awk
---
pattern-directed scanning and processing language

what is awk good for?
---------------------
    AWK is great for manipulating text files which are divided into records or lines, 
    and in which each line is divided into fields. 
    It doesn't require that every line have the same format. 
    It's very happy with plain English text. 
    But if the file is more structured, like a spreadsheet or database, 
    there are more things you can do with it. 

what is awk not good for?
-------------------------
    binary data such as Word or Excel files
    
how awk works?
--------------
    AWK looks at its input as a series of records, each record consisting of a series of fields, like, $1, $2. 
    By default, each record is a line of text. 
    And each field is separated from the next by white space, 
    one or more spaces and/or tab characters. 
    
fileds in a record(line)
------------------------
    $1, first field
    $0, the entire line
    
field seperator
---------------
- awk '{print $2, $1}' file.txt <- the comma tells awk to insert a field seperator, which is a single space by default
- awk '{print $2 "--" $1}' file.txt <- there is no comman, no seperator. the fields will be concatenated by "--".


awk statement
-------------
It consists of a pattern and or an action. 
You can omit the pattern or the action, but not both. 
The action part of an Awk statement is enclosed in curly braces.
```
awk '/up/{print NF, $0}' file.txt
  pattern: /up/ . <- process the line matches this pattern, NF is the number of files in this record
  action: {print NF, $0}

awk 'NF==6{print NF, $0}' file.txt
  pattern: NF==6 . <- process the line which has 6 fields
  action: {print NF, $0}
  
awk 'NF==6' file.txt
  pattern: NF==6 . <- process the line which has 6 fields
  action: momited
  simply print those lines with 6 fields
  
awk '/up/{print "UP:", NF, $0} /down/{print "DOWN:", NF, $0}' file.txt
  pattern: /up/ or /down/
  action:  {print "UP:", NF, $0} or {print "DOWN:", NF, $0} 
```

awk command-line flags
----------------------
- **f** flag, progrom file
- **F** flag, tells awk the seperator of the record(line) explicitly
```
awk -F , '{print $1}' file.txt
```
- **v** flag, specify the value of a awk variable, 
```
awk -v hi=HELLO '{print $1, hi}' file.txt
```

record, field and seperator
===========================

input field seperator
---------------------
    default filed seperator is a certain amout of while spaces
    can be any string of characters, i.e., awk -F ABC '{print $2}'
    can be any regular expression, i.e., awk -F '[,!]' '{print $2}'
    specify seperator within awk program, i.e., awk 'BEGIN{FS=","} {print $2}'
    
input record seperator
----------------------
    by default, awk treats each line of its input as a seperate record.
    the definition of a line depends on your operating system and how it's configured.
    awk 'BEGIN{RS="!;"FS=","} {print $2}'
    
output field/record seperator
-----------------------------
    default output field seperator is a single space, default output record seperator is a new line
    It can be customized as, awk 'BEGIN{OFS=", ";ORS="!"} {print $2, $1}'


formatting output with width and precision specifiers
-----------------------------------------------------
- printf(format, value...), like printf("%s\t%s\t%d\n", $1, $2, $3), where \t is tab, \n is new line
- printf("%-20s %-30s %-3d %6.2f d\n", $1, $2, $3, $4), 
  where -20, -30, -3 is the width specifier and each field is aligned to the left due to negative sign,
  s, string
  d, integer
  f, floating number
  6.2, the field has a width of 6 where 2 of them is for fractional part


operators
---------
    +, -, *, /, %, ^
    ++, --
    =, +=, -=, *=, /=, %=, ^=
    ==, !=, <. <=, >, >=
    ~, ~=, regular expression comparision
    [], arrary subscript, for example, awk '{a[1]=$1; a[2]=$2; a[3]=$3; print a[1], a[2], a[3]}'
    

built-in variable
-----------------
    FS, input field seperator 
    RS, input record seperator
    OFS, 
    ORS, 
    NF, number of fields in a record 
    NR, nth of record
    FILENAME
    FNR, nth of record in that file
    $0, represents the whole line
    $1, reprsents first field in that line
    
user-defined variable
---------------------
    awk '{hello=$1; goodbye=$2; print hello, goodbyle}' file.txt
    awk '{hello=1; goodbye=2; print hello goodbyle}' file.txt
    awk '{a=1; b=2; c=3; print a b*c}'
    
control structure
=================

if else
-------
    awk '{ if (NF < 8) {print "short line:", $0} else {print "long line", $0}}' file

```
Alternatively, put those long code lines in a script file
cat > script.awk
{
    if (NF<8) {
        print "short line:", $0
    } else {
        print "long line", $0
    }
}

awk -f script.awk file.txt
```

```
Alternatively, put everything in bash script
cat > script.sh
awk '{
        if (NF<8) {
            print "short line:", $0
        } else {
            print "long line", $0
        }
}' file.txt
```

for statement
-------------
```
cat > script.awk
{
    # print first three fields in each line
    for(i=1; i<=3; i++) {
        print "Line " NR ", field " i ": " $i;
    }
}
````

functions
=========
string manipulation function
----------------------------
- length([string]), if empty, it means $0(entire line)
- index(string, target), return the position of first occurence if there is any; 0 means not found
- match(string, regexp), return position; set RSTART to location of the match; set RLENGTH to the length of that match
- substr(string, start[, length]), return sub-string
'''
\# if there is a "the" in the line, delete the first "the", otherwise just print the whole line
cat > script.awk
BEGIN {
  target = "the";
}
{
  s = index($0, target);
  if (s == 0) {
    print;
  } else  {
    print substr($0, 1, s-1) substr($0, s + length(target));
  }
```
- sub(regexp, newval[,string]), if string is not provided, it means $0(whole string)
- gsub(regexp, newval[,string]), globally
- split(string, array[,regexp]), split string into pieces which are saved in array, using regexp as the seperator
```

math functions
--------------
- int(x), int(3.9)->3
- rand(), return a value in \[0, 1\), for example int(ran()*6)+1-> randomly return an integer in \[1,2,3,4,5,6\]
- srand(\[x\]), seed of the rand function
- sqrt(x)
- sin(x)
- cos(x)
- log(x)
- exp(x)

associative array
-----------------
the key of the array could be anything, like a\["first"\] = $1

for-in statement
```
# example 1
# the order is not guaranteed in the for loop
# convert every field into lower case and find out the number of occurrences of each lowcased field
{
        for ( i=1; i<=NF; i++ ) {
                words[tolower($i)]++;
        }
}
END {
        for ( i in words ) {
                print i, words[i];
        }
}

# example 2
# transpose a table
{
        for ( i=1; i<=NF; i++ ) {
                a[NR ":" i] = $i;
        }
        if ( NF > maxNF ) {
                maxNF = NF;
        }
}
END {
        for ( field=1; field<=maxNF; field++ ) {
                for ( rec=1; rec<=NR; rec++ ) {
                        printf ( "%-10s", a[rec ":" field] );
                }
                printf("\n");
        }
}
```

  
