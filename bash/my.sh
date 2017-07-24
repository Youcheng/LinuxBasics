#!/bin/bash
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
