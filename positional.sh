#!/bin/bash

for ((i=0;i<=2;i++)) do
    echo $i
done

echo $i

if [ $i -eq 3 ] 
then
    echo "It is three"
fi

echo -e "please enter your choice\n1.searh by year\n2.search by state"
read choice

if [ $choice -eq 1 ] 
then
    echo "choice by year selected"
fi