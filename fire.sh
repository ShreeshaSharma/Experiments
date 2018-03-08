byte3=10
while [ $byte3 -lt 11 ]
do
	byte4=2
	while [ $byte4 -lt 256 ]
	do
		avahi-resolve-address 172.16.$byte3.$byte4
		let byte4=byte4+1
	done
	echo ""
	let byte3=byte3+1
done
