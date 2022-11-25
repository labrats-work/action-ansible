# Ansible docker action

## Example usage

``` yml
- uses: labrats-work/action-ansible@v1
  with:
    workingDirectory: ./ansible
    requirementsFile: requirements.yml
    inventoryFile: inventory
    playbookFile: site.yml
    sshKey: ${{ secrets.SSH_PRIVATE_KEY }}
```

## Inputs

|Variable|Required|Default|
|---|---|---|
|workingDirectory|false|.|
|requirementsFile|false|requirements.yml|
|inventoryFile|false|inventory|
|playbookFile|false|site.yml|
|sshKey|false|   |

## Outputs

|Variable|Type|
|---|---|
|ansibleVersion|string|
---

## Requirements

- [x] Ability to specify working directory
- [x] Ability to specify requirements file
- [x] Ability to specify inventory file
- [x] Ability to specify playbook file
- [x] Ability to specify sshkey
- [x] Outputs the ansible version
- [x] Tests to validate passing scenarios
- [x] Tests to validate failing scenarios
