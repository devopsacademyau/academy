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

## Commands

- aws iam create-user

  Creates a new IAM user for your AWS account.

  Obligatory arguments :

  | Parameter   | Description                                                                     |
  | :---------- | :------------------------------------------------------------------------------ |
  | --user-name | Friendly name of the policy. IAM user, group, role, and policy (must be unique) |

- aws iam create-policy

  Creates a new managed policy for your AWS account.

  Obligatory arguments :

  | Parameter         | Description                                                                     |
  | :---------------- | :------------------------------------------------------------------------------ |
  | --policy-name     | Friendly name of the policy. IAM user, group, role, and policy (must be unique) |
  | --policy-document | Json policy document that you wuant to use as the content for the new policy.   |

- aws iam attach-user-policy

  Attaches the specified managed policy to the specified user.

  Obligatory arguments :

  | Parameter    | Description                                                                     |
  | :----------- | :------------------------------------------------------------------------------ |
  | --user-name  | Friendly name of the policy. IAM user, group, role, and policy (must be unique) |
  | --policy-arn | Json policy document that you wuant to use as the content for the new policy.   |

- aws iam detach-user-policy

  | Parameter    | Description                                                                     |
  | :----------- | :------------------------------------------------------------------------------ |
  | --user-name  | Friendly name of the policy. IAM user, group, role, and policy (must be unique) |
  | --policy-arn | Json policy document that you wuant to use as the content for the new policy.   |

- aws iam create-acess-key

  Creates a new AWS secret access key and corresponding AWS access key ID for the specified user.

  Arguments :

  | Parameter   | Description                                               |
  | :---------- | :-------------------------------------------------------- |
  | --user-name | The name of the IAM user that the new key will belong to. |

---

Answer for exercise [c04-iam01](https://github.com/devopsacademyau/academy/blob/4d3701fa0791064e8a5b737acae52c992faaa07e/classes/04class/exercises/c04-iam01/README.md)
