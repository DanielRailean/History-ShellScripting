#!/bin/bash
end=$(cat /etc/shells | sed '1d' | wc -l)
for i in `seq $end`; do 	
	string=$(cat /etc/shells | sed '1d' | sed -n "$i"p)
	cat /etc/passwd | sort | grep "$string" | cut -d":" -f1
done


