#!/usr/bin/env bash

# Check if the alias already exists in the .bash_profile
    grep -q 'alias tf="terraform"' ~/.bash_profile
# $? is a special variable in bash that holds the exit status of the last command
if [ $? -ne 0 ]; then
    # if the alias does not exist append it
    echo 'alias tf="terraform"' >> ~/.bash_profile
    echo "Alias 'tf' added to ~/.bash_profile"
else
    #   Inform the user if the alias already exist
    echo "Alias already exist in .bash_profile"
fi

#   Oprional: source the .bash_profile to make the alias avaialble immediately
source ~/.bash_profile