#!/bin/sh -l

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
export KEYFILE=
if [ ! -z "$INPUT_KEYFILE" ]
then
  echo "\$INPUT_KEYFILE is set. Will use ssh keyfile for host connections."
  export KEYFILE="--key-file ${INPUT_KEYFILE}"
else
  echo "\$INPUT_KEYFILE not set. You'll most probably only be able to work on localhost."
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

cd $workingDirectory

echo "going to execute: "
echo ansible-playbook ${INVENTORY} ${INPUT_PLAYBOOKFILE} ${EXTRAFILE} ${INPUT_EXTRAVARS} ${KEYFILE} ${KEYFILEVAULTPASS} ${VERBOSITY}
ansible-playbook ${INVENTORY} ${INPUT_PLAYBOOKFILE} ${EXTRAFILE} ${INPUT_EXTRAVARS} ${KEYFILE} ${KEYFILEVAULTPASS} ${VERBOSITY}
