#!/bin/sh -l

# get version
nsbl_version=$(ansible --version | head -n 1)
nsbl_requirements=$1
nsbl_inventory=$2
nsbl_playbook=$3
nsbl_workingdirectory=$4
nsbl_sshkey=$5

# output nsbl_version
echo "nsbl_version=$nsbl_version" >> $GITHUB_OUTPUT
# output nsbl_requirements
echo "nsbl_requirements=$nsbl_requirements" >> $GITHUB_OUTPUT
# output nsbl_inventory
echo "nsbl_inventory=$nsbl_inventory" >> $GITHUB_OUTPUT
# output nsbl_playbook
echo "nsbl_playbook=$nsbl_playbook" >> $GITHUB_OUTPUT

cd $nsbl_workingdirectory

if [ -z "$nsbl_sshkey" ]
then
    echo "Adding ssh-key to agent"
    eval `ssh-agent`
    echo "$nsbl_sshkey" | ssh-add - > /dev/null
    ssh-add -l
fi

ansible-galaxy install -r $nsbl_requirements

ansible-playbook -i $nsbl_inventory $nsbl_playbook