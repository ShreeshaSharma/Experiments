if [ $# -ne 3 ]
then 
	echo "$0 <start> <end> <outfile>" 
	echo "Need 3 arguments, given $#"
else
	start=$1 
	end=$2 
	file=$3
	interval=0.3
	byte3=$start

	trap "exit" INT
	while [ $byte3 -lt $end ]
	do
		byte4=2
		while [ $byte4 -lt 256 ]
		do
			#if [ ping -q -c 2 -i 0.4 172.16.$byte3.$byte4 ]
			#then
			#	avahi-resolve-address 172.16.$byte3.$byte4
			#fi
   			#ping -q -c 2 -i $interval 172.16.$byte3.$byte4 && avahi-resolve-address 172.16.$byte3.$byte4 >> $file || ping -q -c 2 -i $interval 172.16.$byte3.$byte4 && echo 172.16.$byte3.$byte4 >> $file 
			
			if ping -q -W 1.6 -c 5 -i $interval 172.16.$byte3.$byte4 &>> $file.log.ping
			then
				if avahi-resolve-address 172.16.$byte3.$byte4 2>> $file.log.avahi | grep "[[:alnum:]]" >> $file.txt
				then
					:
				else
					echo 172.16.$byte3.$byte4 >> $file.txt
				fi
			fi

			let byte4=byte4+1 
		done 
		echo "" 
		let byte3=byte3+1 
	done
fi
