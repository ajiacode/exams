#!/bin/bash

counter=0
line_count=0
while read -r line
do
    w=${#line}
    indicator=0
    counter=0
    pos1=0
    pos2=0
    comma_count=0
    ((line_count++))
    nline=$line
    a=""
    for ((i=0;i<=${#line};i++)) do
        l=${line:$i:1}
        k=$(($i+1))
        if [ "$l" == "\"" ]
        then
            ((counter++))
            if [ $counter -eq 2 ]
            then
                counter=0
            fi
        fi

        if [ $counter -eq 1 ]
        then
            if [ "$l" == "," ]
            then
                a+=" "
            else
                a+=$l
            fi
        else
            a+=$l
        fi
    done

    if [ $counter -eq 2 ]
    then
        echo $a >> new_file.txt
    fi

done < short.csv


