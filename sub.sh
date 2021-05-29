#!/bin/bash


# cut -d, -f1 simp* | grep -a -i "nedlands\|crawley" >> suburbs.csv

while read line 
do
    echo $line
    sleep 0.1s
    grep -a "$line" simple* >> valid.csv

done < suburbs.csv

grep -ah "ethernet" valid* | grep -a '$[0-7]' >> valid2.csv

# for ((i=1;i<=6;i++)) do
#     cat valid2.txt | awk -v i=$i -F',' '{ print $i }'
# done
cut -d, -f1,4,5 valid2* >> column.csv