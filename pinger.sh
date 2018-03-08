byte3=2
while [ $byte3 -lt 12 ]
do
	byte4=2
	while [ $byte4 -lt 256 ]
	do
		#if [ ping -q -c 2 -i 0.4 172.16.$byte3.$byte4 ]
		#then
		#	avahi-resolve-address 172.16.$byte3.$byte4
		#fi
		ping -q -c 2 -i 0.4 172.16.$byte3.$byte4 && avahi-resolve-address 172.16.$byte3.$byte4  >> $1 || ping -q -c 2 -i 0.4 172.16.$byte3.$byte4 && echo 172.16.$byte3.$byte4 >> $1
		let byte4=byte4+1
	done
	echo ""
	let byte3=byte3+1
done
