#!/bin/bash
echo "Numarul de argumente este $#."
sum=0
# loop over all numbers on the command line
# note: we don't verify that these are in fact numbers
for number do
    w=0         # Hamming weight (count of bits that are 1)
    n=$number   # work on $n to save $number for later

    # test the last bit of the number, and right-shift once
    # repeat until number is zero
    while (( n > 0 )); do
        if (( (n & 1) == 1 )); then
            # last bit was 1, count it
            w=$(( w + 1 ))
        fi

        if (( w > 1 )); then
            # early bail-out: not a power of 2
            break
        fi

        # right-shift number
        n=$(( n >> 1 ))
    done

    if (( w == 1 )); then
    	if (( number != 1)); then 
    	   printf '%d\n' "$number"
    	   
    	fi
        # this was a power of 2
    fi
done
for inputnr do
	case $inputnr in
    ''|*[!0-9]*);;
    *) sum=$((sum+inputnr));;
esac
done
printf 'Suma numerelor este %d.\n' "$sum"