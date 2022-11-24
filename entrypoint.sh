#!/bin/sh -l

# get version
ansibleVersion=$(ansible --version | head -n 1)
requirementsFile=$1
inventoryFile=$2
playbookFile=$3
workingDirectory=$4

# output ansibleVersion
echo "ansibleVersion=$ansibleVersion" >> $GITHUB_OUTPUT
# output requirementsFile
echo "requirementsFile=$requirementsFile" >> $GITHUB_OUTPUT
# output inventoryFile
echo "inventoryFile=$inventoryFile" >> $GITHUB_OUTPUT
# output playbookFile
echo "playbookFile=$playbookFile" >> $GITHUB_OUTPUT

cd $workingDirectory

ansible-galaxy install -r $requirementsFile

ansible-playbook -i $inventoryFile $playbookFile