terraform {
  /*cloud {
    organization = "shammy21"

    workspaces {
      name = "terra-house-1"
    }
  }*/
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }

  aws = {
      source = "hashicorp/aws"
      version = "5.22.0"
    }
  }
}


provider "aws" {
  # Configuration options
}

provider "random" {
  # Configuration options
}