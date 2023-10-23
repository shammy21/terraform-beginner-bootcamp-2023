# Terraform Beginner Bootcamp 2023

##  Semantic Versioning :mage:

This project is going to utilize semantic versioning for its tagging 
[semver.org](https://semver.org/)

The General Format:

 **MAJOR.MINOR.PATCH**, eg. `1.0.1`

-   **MAJOR** version when you make incompatible API changes
-   **MINOR** version when you add functionality in a backward compatible manner
-   **PATCH** version when you make backward compatible bug fixes

##  Install the terraform CLI

### Considerations with the Terraform CLI changes
The Terraform CLI installation instructions have changed due to gpg keyring changes. We needed to refer to the latest CLI install instructions via Terraform Documentation and change the scripting for install.

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Consideration for Linux Distribution

This project is built against Ubuntu.
Please consider checking you Linux Distribution and change accordingly to distribution needs.

[How to check Linux OS Version in Linux](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

```
$ cat /etc/os-release
PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy

Example of checking OS version

```
###  Refactoring into Bash Scripts

While fixing Terraform CLI deprecation issues we noticed the installation steps were a considerable amount more code so we decided to create a bash script to install the terrafom CLI. 

This bash script is located here: [./bin/install_terraform_cli.sh](./bin/install_terraform_cli.sh )


-   This will keep the Gitpod Task File ([.gitpod.yml](.gitpod.yml/)) tidy
-   This will allow us an easier time to depug and install manually Terraform CLI install. 
-   This will allow for bewtter portability to install Terrafomr CLI

#### Shebang Consideration

A Shebang (pronounced Sha-bang) tells the bash script what interpurter program will interpret the script eg. `#!/bin/bash`

ChatGPT recommended we use this format for bash `#1/usr/bin/env bash`

-   for portability for different OS distributions
-   will search user's Path for the bash executable

https://en.wikipedia.org/wiki/Shebang_(Unix)

#### Execution Considerations

When executing that script we can use the `./` shorthand notation to execute the bash script.

eg. `./bin/install_terraform_cli.sh`

If we are using a script in .gitpod.yml we need to point the script to a program to interpret it

eg. `source ./bin/install_terraform_cli.sh`

#### Linux Permissions Considerations

In order to make our bash scripts executable, we need to change linux file permissions to make the file executable in user mode.

```sh
chmod u+x ./bin/install_terraform_cli.sh
```
Alternatively: 

```sh
chmod 774 ./bin/install_terraform_cli.sh
```
https://en.wikipedia.org/wiki/Chmod

### Github Lifecycle (Before, Init, Command)

We need to be careful when using the Init becasue it will not rerun if we restart an existing workspace. 

https://www.gitpod.io/docs/configure/workspaces/tasks

### Working Env Var

We can list all Environment Variables (Env Vars) using the `env` command 

We can filter specific env vars using grep eg. `env var | grep GITPOD`

#### Setting and Unsetting Env Vars

In the terminal we can set using `export HELLO='world'`

In the terminal we can unset using `unset HELLO`

We can set an Env Var temperarly when just running a command

```sh
HELLO='world' ./bin/print_message
```
Within a bash script we can set the following without writing export eg.

```sh
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
```

####  Printing Env Vars

We can print an Env Var using echo eg. `echo $HELLO`

#### Scopeing of Env Vars

When you open up new bash terminals in VSCode it will not be aware of env vars that you have set in another window

If you want env vars to persist across all future bash terminals that are open you need to set env vars in your bash profile eg. `.bash_profile`

####    Persisting Env Vars in Gitpod

We can persist env vars into Gitpod by stroing them in Gitpod Secrets Storage.

```
gp env HELLO='world'
```
All future workspaces launched will set the env vars for all bash terminals open in those workspaces

You can also set env vars in the `.gitpod.yml` but this can only contain non-sensitive env vars

### AWS CLI Installation

AWS CLI is installed for this project via the bash script [`./bin/install_aws_cli`](./bin/install_aws_cli)

[Install or update the latest version of the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

####    AWS CLI Env Vars

Env Vars CLI example:

```sh
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=us-west-2
```

[AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credentials are configured correctly by running the followwing command:

AWS CLI Command:
```sh
aws sts get-caller-identity
```

If it is succesful you should see a JSON payload retrun that looks like this:
```json
    "UserId": "IDAD23APV7GT6ZJHA4tytyYP",
    "Account": "745328345312",
    "Arn": "arn:aws:iam::745328345312:user/terraform-beginner-bootcamp"
```
We will need to generate AWS CLI credentials for IAM user in order to use the AWS CLI.

##   Terraform Basics

### Terraform Registry

Terraform source their providers and modules from the Terraform Registry which is located at [registry.terraform.io](https://registry.terraform.io/)

-   **Providers** Providers are a logical abstraction of an upstream API. They are responsible for understanding API interactions and exposing resources.
-   **Modules** Modules are containers for multiple resources that are used together. A module consists of a collection of .tf and/or .tf.json files kept together in a directory. Modules are the main way to package and reuse resource configurations with Terraform.

[Random Terraform Provider](https://registry.terraform.io/providers/hashicorp/random/latest/docs)
[AWS Terraform Modules](https://registry.terraform.io/namespaces/terraform-aws-modules)


### Terraform Console

We can see a list of all the terraform commands by simply typing `terraform` 


### Terraform Init

At the start of a new project we will run `terraform init` to download th ebinaries for the terraform providers that we will use in this project 

### Terraform Plan

`terraform plan`

This will generate out a changeset, about the state of our infrastructure and what will be changed.

We can output this changeset i.i. "plan" to be passed to an apply, but often you can just ignore outputting.

### Terraform Apply

`terraform apply`

This will run the plan and pass changeset to executred by terraform Apply should propmt yes or no. If we want to automatically approve an apply we can provide the auto approve flag eg. `terraform apply --auto-approve`

### Terraform Lock Files

`.terraform.lock.hcl` contains the locked versioning for the providers or modules that should be used with this project

The terraform Lock File **should be commited** to your Version Control System (VSC) eg. GitHub

### Terraform State Files

`.terraform.tfstate` Containes information about the current state of your infrastructure this file **should not be commited** to your VCS.

This file can contain sensitive data.

If you lose this file you lose knowing the state of your infrastructure.

`.terraform.tfstate.backup` is the previous state file state.

### Terrafomr Directory

`.terraform` directory containes binaries of terraform providers.