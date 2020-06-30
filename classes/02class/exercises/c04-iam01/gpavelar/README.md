# c04-iam01

## Command Execution Output

- [cli_commands.txt](cli_commands.txt)

```bash
## Creating user
aws iam create-user --user-name user_readonly_S3
# output
USER    arn:aws:iam::478433196210:user/user_readonly_S3 2020-06-30T01:29:47+00:00       /       AIDAW6ZGXHCZPKJ6IB6AR   user_readonly_S3

## Creating policy
aws iam create-policy --policy-name S3readOnly --policy-document file://s3-policy-document.json

# output
POLICY  arn:aws:iam::478433196210:policy/S3readOnly     0       2020-06-30T02:14:21+00:00       v1      True    /       0       ANPAW6ZGXHCZDC7JHAP3C
   S3readOnly      2020-06-30T02:14:21+00:00
```

File:

```json
{
  "Statement": [
    {
      "Sid": "AllowEveryoneReadOnlyAccess",
      "Effect": "Allow",
      "Action": ["s3:Get*", "s3:List*"],
      "Resource": ["arn:aws:iam::478433196210:user/user_readonly_S3"]
    }
  ]
}
```

## Errors

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

* aws iam attach-user-policy

  Attaches the specified managed policy to the specified user.

  Obligatory arguments :

  | Parameter    | Description                                                                     |
  | :----------- | :------------------------------------------------------------------------------ |
  | --user-name  | Friendly name of the policy. IAM user, group, role, and policy (must be unique) |
  | --policy-arn | Json policy document that you wuant to use as the content for the new policy.   |

---

Answer for exercise [c04-iam01](https://github.com/devopsacademyau/academy/blob/4d3701fa0791064e8a5b737acae52c992faaa07e/classes/04class/exercises/c04-iam01/README.md)
