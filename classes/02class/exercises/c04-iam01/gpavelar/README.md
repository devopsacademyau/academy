# c04-iam01

## Command Execution Output

- [cli_commands.txt](cli_commands.txt)
- [s3-policy-document.json](s3-policy-document.json)

## Errors

I got some errors while doing the exercies, some mistakes about files and policies.

- CreatePolicy:

  > `Policy document must be version 2012-10-17 or greater.`

  Solution: Added Version on json policy file.

  > `Policy document should not specify a principal.`

  Solution: Removed "Principal" key from json policy file.

---

Answer for exercise [c04-iam01](https://github.com/devopsacademyau/academy/blob/4d3701fa0791064e8a5b737acae52c992faaa07e/classes/04class/exercises/c04-iam01/README.md)
