#!/bin/bash

INPUT=$1
OLDIFS=$IFS
IFS=,

[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

while read template datastore folder prefix
do
	for i in `seq 1 12`; do
		python2.7 ../scripts/clone_vm.py --host cdr-vcenter1.cse.buffalo.edu -u ad\\UBIT -p UBITPW --datastore-name $datastore --template $template --vm-folder $folder --no-power-on --cluster MAIN  --vm-name "$prefix$i";
	done
done < $INPUT

IFS=$OLDIFS