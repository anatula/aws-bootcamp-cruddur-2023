# Week 0 — Billing and Architecture

## My personal notes 

- [Global Infrastructure :earth_americas:](./notes/aws-infra.md)

- [Free Tier notes :free:](./notes/free-tier.md)

- [Loggin services :mag:](./notes/logging.md)

- [Security considerations :passport_control:]( ./notes/security.md)

- [Growing list of AWS services :toolbox:]( ./notes/services.md)

This are the notes I took from the livestream lesson:

![notes](./assets/week0/notes_livestream_week0.jpg)

## Homework Security

- Setup MFA for root
- Create IAM user with admin policy with MFA

  ![](./assets/week0/aws_iam.png)

- Configure Billing preferences
  ![](./assets/week0/billing_settimgs.png)

- Create a 'Zero Spend Budget'
  ![](./assets/week0/zero_budget.png)

- Create a CloudWatch Billing metric Alert for 10USD dollars
  ![](./assets/week0/alert.png)

  - Confirmed SNS topic to receive email alerts
    ![](./assets/week0/sns_topic.png)

Budget considerations :
- 1 Budget created out of the 2 of the Free Tier
- 1 CloudWatch Alarm out of 9 of thr Free Tier

## Lucid Chart Homework

This is to explain our idea to a business person. There are a lot of ways to communicate. Need to emphasize and show our important features.
Start with a single user. What can the user do? It has a frontend serving a website, a backend that's going to do something to the data. 
 
DumbQuestion: Are users unique? everyone has it's own identity?
>Yes, we need to store stateful data for: "tweets" that need to be deleted (ephemeral) and the identity of the person (in perpetuity)

DQ: Do we show multiple storages? The one for direct messages is different
>Only if you know the need for a different type for db (no need to pick the product)

DQ: Is it highly available?
>We need a load balancer on the frontend to distribute traffic as necessary

DQ: Is the load balancer talking directly to the backend too?
>There's an API, people could hit it. Make it a backend accessible to user, an exposed API.

DQ: There is a real-time component, the messaging system has real-time updates. Do we show it?
>Show them in separate mechanism.

DQ: Show communication between frontend and backend.
>Absolutely, to explain how it works at a high level

DQ: Put the Search service?
>Yes, Where it's gonna live?

Doesn't live in the cluster, it's a big system, it's it own thing

DQ: Authentication?
>They are managed services, put decentralized Service for auth.

DQ: Protection from Ddos  attack?
>We assume the security and scalability is provided by AWS. Unless this is highly secure env, and this happens a lot, this gotta be addressed.

DQ: We need a timeline service, to curate the feed, do we show it?
>If it's a distinguished and it's important, show it

DQ: Imagine if we had a partnership with Momento or special thing
>The person needs to understand the business issue we're trying to solve, put the process name with the tool for that. The use of Momento is a constraint as a pre-selected option.

### Conceptual diagram
![](./assets/week0/Cruddur_Conceptual_Diagram.jpeg)
[conceptual diagram link](https://lucid.app/lucidchart/invitations/accept/inv_2851885e-a97c-4c19-8b5e-e8229d163ec0)
  
  

### Logical diagram
![](./assets/week0/Cruddur_Logical_Diagram.jpeg)
[logical diagram link](https://lucid.app/lucidchart/invitations/accept/inv_3da7cb06-0646-4bbd-b623-80f75a26cc47)

## Generate AWS Credentials
Using the AWS console:

You can have up to 2 credentials.

![aws credentials](./assets/week0/access_key.png)
## Cloud Shell
Using the CloudShell from the browser:

![cloud shell](./assets/week0/cloud-shell.png)

## AWS CLI

### Installation

AWSCLI is already installed on CloudShell, we need to install it in our local computer or gitpod (not in the repo's folder, in `workspace` folder), with this instructions (linux):

```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip awscliv2.zip

sudo ./aws/install
```
[awscli instructions](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions)

### Set env variables
AWSCLI need this env vars set:
```
$ export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
$ export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
$ export AWS_DEFAULT_REGION=us-west-2
```
*This is an example

[configure env vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html#envvars-set)

Used this steps to install awscli in an ephemeral gitpod:

![ephemeral git pod installation](./assets/week0/local-gitpod.png)

Now do this every time gitpod starts it install all this. Use this gitpod configuration `gitpod.yaml`
```
tasks:
  - name: aws-cli
    env:
      AWS_CLI_AUTO_PROMPT: on-partial
    init: |
      cd /workspace
      curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
      unzip awscliv2.zip
      sudo ./aws/install
      cd $THEIA_WORKSPACE_ROOT
```

The env `AWS_CLI_AUTO_PROMPT` is partial mode:

- Partial mode: Uses auto-prompt if a command is incomplete or cannot be run due to client-side validation errors. This mode is particular useful if you have pre-existing scripts, runbooks, or you only want to be auto-prompted for commands you are unfamiliar with rather than prompted on every command.

Then push this code changes and save the env vars (AWS_ACCESS_KEY_ID,..) inside gitpod in a safe area using:

`gp env ENV_VAR=VALUE`

![git pod changes](./assets/week0/gitpod_config_and_envs.png)

And then our gitpod now starts with awscli installed, and with our account already setup!

As last step get the previously created budget from our gitpod using the awscli:

![gitpod describe budget](./assets/week0/gitpod-aws-budget.png)

