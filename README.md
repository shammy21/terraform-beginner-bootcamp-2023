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
The Terraform CLI installation instructions have chnaged due to gpg keyring changes. We needed to refer to the latest CLI instructions via Terraform Documentation and cgane the scripting for install.

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