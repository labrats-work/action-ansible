# Ansible docker action

## Example usage

``` yml
- uses: labrats-work/action-ansible@v1
  with:
    workingDirectory: ./ansible
    requirementsFile: requirements.yml
    inventoryFile: inventory
    playbookFile: site.yml
```

## Inputs

|Variable|Type|Required|Default|
|---|---|---|---|
|workingDirectory|input|false|.|
|requirementsFile|input|false|requirements.yml|
|inventoryFile|input|false|inventory|
|playbookFile|input|false|site.yml|
|keyfile|env|false|   |

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
- [ ] Dont build push on every commit
