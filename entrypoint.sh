#!/bin/sh -l

# get version
ansible_version=$(ansible --version | head -n 1)

# output version
echo "ansible_version=$ansible_version" >> $GITHUB_OUTPUT
# output ansible_requirements
echo "ansible_requirements=$1" >> $GITHUB_OUTPUT
# output ansible_inventory
echo "ansible_inventory=$2" >> $GITHUB_OUTPUT