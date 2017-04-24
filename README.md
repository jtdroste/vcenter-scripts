# vcenter-scripts
Various vCenter Scripts.  For this to work, please install all the python requirements from `requirements.txt`. This can be done by running the following command:

```
pip install -r requirements.txt
```

## MassClone
MassClone was a script built for UBNetDef's competition - Lockdown.  It takes in an input file and a team id.  The input file must have the following information:

```
VM_Template_Name,datastore_to_store,folder_to_save_to,prefix_of_vm_
```

It will utilize the script located in `scripts/clone_vm.py`.  To mass clone multiple times, wrap it into a loop.  Example:

```
for i in `seq 1 11`; do ./clone.sh list $i; done;
```

## Samples
This folder contains a bunch of community samples from vcenter. They *should* work.

## Misc Commands
The file (`misc_commands.txt`) commands lists the usage of the script `scripts/clone_vm.py`.