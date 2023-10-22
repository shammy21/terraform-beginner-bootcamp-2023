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