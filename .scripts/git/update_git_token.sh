#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
  echo "Usage:"
  echo "    update-git-token <username> <repo> <token>"
  echo "    or"
  echo "    ugt <username> <repo> <token>"
  exit 1
fi

# Assign arguments to variables
USERNAME=$1
REPO=$2
TOKEN=$3

# Update the Git remote URL with the new token
git remote set-url origin https://$TOKEN@github.com/$USERNAME/$REPO.git

# Verify the new remote URL
git remote -v

echo "Token updated successfully for repository $REPO"
