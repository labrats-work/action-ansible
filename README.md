# Ansible docker action

This action:

- [x] Prints the ansible version
- [x] Ability to specify a requirements file
- [x] Ability to specify an inventory file
- [x] Ability to specify a sshkey

---

## TODO

- [ ] Tests to validate passing scenarios
- [ ] Tests to validate failing scenarios
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