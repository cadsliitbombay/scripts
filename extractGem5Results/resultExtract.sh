#!/bin/bash

# This script will extract all the desired parameters from all the benchmarks
# in the result folder and produce a csv file with all the needed results.

benchmarks=$(ls results)

parametersToExtract=$(cat parameters)

for benchmark in $benchmarks
do
    printf "%s,"  "$benchmark"
	file=results/$benchmark/stats.txt
	for parameter in $parametersToExtract 
	do
		#echo $benchmark " " $parameter
		#grep  $parameter $file | awk -F"/" '{print $1,$2}'|awk '{print $2}' 
		line=$(grep  $parameter $file | awk -F"/" '{print $1,$2}' | awk '{print $2}')
        printf "%s," "$line"
	done
    printf "\n"
done
