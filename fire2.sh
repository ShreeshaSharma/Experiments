byte3=1
while [ $byte3 -lt 256 ]
do
	if ping -qc 2 192.168.$byte3.89
	then
		echo 192.168.$byte3.189 >> ~/search.txt
	fi
	let byte3=byte3+1
done
