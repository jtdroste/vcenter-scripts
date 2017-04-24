#!/bin/bash
if [ "$#" -ne 2 ]; then
	echo "Usage: $0 [input-list] [team-id]"
	exit 1
fi

INPUT=$1
TEAM=$2

if [ ! -f "$INPUT" ]; then
	echo "$INPUT file not found"
	exit 99
fi

USERNAME=""
PASSWORD=""

OLDIFS=$IFS
IFS=,

while read template datastore folder vmprefix; do
	python2.7 ../scripts/clone_vm.py --host cdr-vcenter1.cse.buffalo.edu -u $USERNAME -p $PASSWORD --datastore-name $datastore --template $template --vm-folder $folder --no-power-on --cluster MAIN  --vm-name "${vmprefix}${TEAM}";
done < $INPUT

IFS=$OLDIFS
