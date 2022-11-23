# Ansible docker action

This action:

- [x] Prints the ansible verion
- [ ] Installs requirements according to {{requirements}} file.
- [ ] Applies inventory according to {{inventory}} file

---

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