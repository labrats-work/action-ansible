# Ansible docker action

This action:

- [x] Prints the ansible verion
- [x] Installs requirements according to {{requirements}} file.
- [x] Applies inventory according to {{inventory}} file

---

## TODO

- [ ] Ability to specify an sshkey file
- [ ] Tests for each scenario
- [ ] Refactor and polish
- [ ] Cleanup the docs

## Inputs

## `ansible_requirements`

**Optional** Inventory file name. Default `"requirements.yml"`.

## `ansible_inventory`

**Required** Inventory file name. Default `"inventory"`.

## Outputs

## `TBD`

TBD

## Example usage

uses: labrats-work/action-ansible@v1
with:
  who-to-greet: 'Mona the Octocat'