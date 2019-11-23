#!/bin/bash
sum=0
du -s /etc/*.conf |sed -n '/.conf/p' | awk '{print $1; sum=$(sum+$1)}' 
du -sh /etc/*.conf |sed -n '/Permission/p' >> ~/error.txt
echo $sum