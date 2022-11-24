#!/bin/sh -l

set -e
set -o pipefail

# get version
ansibleVersion=$(ansible --version | head -n 1)
# output ansibleVersion
echo "ansibleVersion=$ansibleVersion" >> $GITHUB_OUTPUT

# Evaluate workingdirectory
if [ ! -z "$INPUT_WORKINGDIRECTORY" ]
then
  echo "\$INPUT_WORKINGDIRECTORY is set. Changing working directory."
  cd $INPUT_WORKINGDIRECTORY
fi


# Evaluate keyfile
if [ ! -z "$KEYFILE" ]
then
  echo "\$KEYFILE is set. Starting ssh-agent and adding to key collection."
  eval `ssh-agent`
  echo "${KEYFILE}" | ssh-add -
  status=$?
  [ $status -eq 0 ] && echo "$cmd command was successful" || exit $status
else
  echo "\$KEYFILE not set. You'll most probably only be able to work on localhost."
fi

# Evaluate verbosity
export VERBOSITY=
if [ -z "$INPUT_VERBOSITY" ]
then
  echo "\$INPUT_VERBOSITY not set. Will use standard verbosity."
else
  echo "\$INPUT_VERBOSITY is set. Will use verbosity level $INPUT_VERBOSITY."
  export VERBOSITY="-$INPUT_VERBOSITY"
fi

# Evaluate inventory file
export INVENTORY=
if [ -z "$INPUT_INVENTORYFILE" ]
then
  echo "\$INPUT_INVENTORYFILE not set. Won't use any inventory option at playbook call."
else
  echo "\$INPUT_INVENTORYFILE is set. Will use ${INPUT_INVENTORYFILE} as inventory file."
  export INVENTORY="-i ${INPUT_INVENTORYFILE}"
fi

# Evaluate requirements.
export REQUIREMENTS=
if [ -z "$INPUT_REQUIREMENTSFILE" ]
then
  echo "\$INPUT_REQUIREMENTSFILE not set. Won't install any additional external roles."
else
  REQUIREMENTS=$INPUT_REQUIREMENTSFILE
  echo "\$INPUT_REQUIREMENTSFILE is set. Will use ${INPUT_REQUIREMENTSFILE} to install external roles."
  ansible-galaxy install --force \
    -r ${REQUIREMENTS} \
    ${VERBOSITY}
fi

echo "going to execute: "
echo ansible-playbook ${INVENTORY} ${INPUT_PLAYBOOKFILE} ${EXTRAFILE} ${INPUT_EXTRAVARS} ${KEYFILEVAULTPASS} ${VERBOSITY}
ansible-playbook ${INVENTORY} ${INPUT_PLAYBOOKFILE} ${EXTRAFILE} ${INPUT_EXTRAVARS} ${KEYFILEVAULTPASS} ${VERBOSITY}
