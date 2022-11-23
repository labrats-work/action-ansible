#!/bin/sh -l

# Print version
ansible_version=$(ansible --version | head -n 1)

echo "ansible_version=$ansible_version" >> $GITHUB_OUTPUT
# Print requirements file
echo "ansible_requirements=$1" >> $GITHUB_OUTPUT
# Print inventory file
echo "ansible_inventory=$2" >> $GITHUB_OUTPUT