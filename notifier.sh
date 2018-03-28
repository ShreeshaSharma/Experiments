trap "exit" INT

while [ true ]
do
	if [ $(( `date "+%M"` % 30)) -eq 00 ]
	then
		notify-send "Time: $(date '+%I:%M %p')"
		sleep 1m
	fi
done
