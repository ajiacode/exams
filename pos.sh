#!/bin/bash

counter=0
a=""
while read -r line
do
    w=${#line}
    indicator=0
    pos1=0
    pos2=0
    for ((i=0;i<=$w;i++)) do
        l=${line:$i:1}
        if [ "$l" == "\"" ]
        then
            if [ $counter -eq 0 ] && [ $indicator -eq 0 ]
            then
                ((counter++))
                pos1=$i
                # echo "the position1 is: $pos1"
            else
                ((counter++))
                pos2=$i
                # echo "the position2 is: $pos2"
            fi
            ((indicator++))
        fi

        if [ $counter -eq 1 ] && [ $indicator -eq 1 ] && [ $i -eq $w ]
        then
            # echo "ONE" ${line:$pos1}
            a+=${line:$pos1}
        elif [ $counter -eq 1 ] && [ $indicator -eq 0 ] && [ $i -eq $w ]
        then
            # echo "TWO" $line
            a+=$line
        elif [ $counter -eq 2 ]
        then
            # echo "THREE" ${line:$pos1:$pos2}
            a+=${line:$pos1:$pos2}
            echo $a >> new_text.txt
            counter=0
            indicator=0
            a=""
        else
            continue
        fi
        done


    # echo $counter
done < test.csv

sed -i 's/"//g' new_text.txt
sed -i 's/\s//g' new_text.txt
