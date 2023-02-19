# Security

When you create an AWS account, you begin with one sign-in identity that has **complete access** to all AWS services and resources in the account. 

This identity is called the AWS account **_root user_** and is accessed by signing in with the email address and password that you used to create the account.

:triangular_flag_on_post: **Don't use the root user for your everyday tasks. Safeguard your root user credentials and use them to perform the tasks that only the root user can perform**

- AWS account: holds all AWS resources, including the different types of users 

- AWS account - Root user: special account with full access that can not be deleted. Created at the time of AWS account creation. Uses Email/Password to Login. Cannot be limited. One root per account.

- AWS account - regular User: user for common tasks that is assigned permissions. Provide account ID/Alias, Username and Password.

- NEVER USE THE ROOT USER'S ACCESS KEYS
- TURN ON MFA

Only root can:
- Change account settings
- Restore IAM user permissions
- Activate IAM access to the Billing and Cost Management Console
- Close AWS account 

[Andrew Brown ExamPro Cloud Practitioner Free Course](https://youtu.be/SOTamWNgDKc)
