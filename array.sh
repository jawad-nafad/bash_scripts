#!/bin/bash
declare -A  arr
arr["name"]="Scott"
arr["id"]="1234"
for i in "${!arr[@]}"
do
    echo "$i: ${arr[$i]}"
done
echo "Displaying current contents  of the folder"
for i in $(ls)
do
   echo "$i: ${arr[$i]}"
done
