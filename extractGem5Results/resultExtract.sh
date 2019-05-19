#!/bin/bash

# This script will extract all the desired parameters from all the benchmarks
# in the result folder and produce a csv file with all the needed results.

if [ ! -d $1 ] 
then
    echo "Give results folder as argument"
    exit 1
fi


folder=$1

benchmarks=$(ls $folder)

parametersToExtract=$(cat parameters)

# Printing the first coloumn
printf "benchmark, "
for parameter in $parametersToExtract
do
    printf "%s, " "$parameter" 
done
printf "\n"

for benchmark in $benchmarks
do
    printf "%s, "  "$benchmark"
	file=$folder/$benchmark/stats.txt
	for parameter in $parametersToExtract 
	do
        # tail is being used to filter out the initial garbage results
		line=$(grep  $parameter $file |tail -n1 |   awk '{print $2}')
        printf "%s, " "$line"
	done
    printf "\n"
done

exit 0
