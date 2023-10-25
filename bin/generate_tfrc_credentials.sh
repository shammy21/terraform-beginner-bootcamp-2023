#!/usr/bin/env bash

# Check if the Terraform Cloud token is set in an environment variable
if [ -z "$TERRAFORM_CLOUD_TOKEN" ]; then
    echo "Error: The TERRAFORM_CLOUD_TOKEN environment variable is not set."
    exit 1
fi

# Define the JSON structure with your Terraform Cloud token
json_data=$(cat <<EOF
{
  "credentials": {
    "app.terraform.io": {
      "token": "$TERRAFORM_CLOUD_TOKEN"
    }
  }
}
EOF
)

# Path to the credentials.tfrc.json file
tfrc_dir="/home/gitpod/.terraform.d"
tfrc_file="${tfrc_dir}/credentials.tfrc.json"

# Check if the .terraform.d directory exists; if not, create it
if [ ! -d "$(dirname "$tfrc_file")" ]; then
    mkdir -p "$(dirname "$tfrc_file")"
fi

# Write the JSON structure to the credentials.tfrc.json file
echo "$json_data" > "$tfrc_file"

# Check if the file was successfully created
if [ -e "$tfrc_file" ]; then
    echo "credentials.tfrc.json file has been generated and configured with your Terraform Cloud token."
else
    echo "Error: Failed to create credentials.tfrc.json file."
    exit 1
fi
