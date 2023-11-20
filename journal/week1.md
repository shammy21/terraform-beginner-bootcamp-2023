# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure

### Our root module structure is as follows:

```
Project_Root
|-- main.tf              - everything else
|-- variables.tf         - stores the structure of input variables
|-- terraform.tfvars     - the data of variables we want to load into our Terraform project
|-- providers.tf         - defined required providers and their configuration
|-- outputs.tf           - stores our outputs
|-- README.md            - required for root modules

```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)
## Terraform Input Variables
## Terraform Cloud Variables

In terraform we can set two kinds of variables:
- Environment Variables - those you would set in your bash terminal eg. AWS credentials
- Terrafomr Variables - those you would normally set in tfvars file

We can set terraform Cloud variables to be sensitive so they are not shown visibly in the UI

### Loading Terraform Input Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)
[Terraform Input Variables AWS Variables](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-variables)


### var flag
We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform -var user_uuid="my-user_id"`

### var-file flag

- TO_DO: document this functionality for terraform cloud

### terraform.tfvars

This is the default file to load in terraform variables in bulk

### auto.tfvars

- TO_DO: document this functionality for terraform cloud

### Order of terraform variables

- TO_DO: documernt which terraform variables take presendence

