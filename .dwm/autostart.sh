#! /bin/bash

mem(){
	mem=`/bin/cat /proc/meminfo | grep -w MemFree | awk '{printf "%.0f MB", $2/1024.0}'`
	echo "Free mem: $mem"
}

dt(){
	dt=$(date +'%a %d %b %H:%M')
	echo "$dt"
}

nitrogen --restore &
while true; do
	xsetroot -name "$(mem) $(dt)"
	sleep 1
done &
