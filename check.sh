#small snippet to see how grep RE works. This one is trying to look for alphanumeric pattern.
if echo $@ | grep -q -E "[\+]* [-]+[[:alnum:]]*"; then
	echo $@
else
	echo "not found"
fi

:<<COMMENT
if echo $@ | grep -q -E -b "\-[t]"
then
	echo $@
else 
	for var in $@ 
	do
		if echo $var | grep -q -E "[0-9a-zA-Z_]+[-]*$"
		then
			if ! [ -f $var ]; then
				echo $var": 1"
			else
				echo $var": 2"
			fi
		fi
	done
fi
COMMENT
