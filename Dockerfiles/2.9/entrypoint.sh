#!/usr/bin/env bash

echo Starting the ssh-agent for convenience
echo And set the environment variable SSH_AUTH_SOCK - ie -s option
eval "ssh-agent -s"

# Loop through the ANSIBLE_SSH_KEY_PASSPHRASE environment variables
for var in $(printenv | grep -oP '^ANSIBLE_SSH_KEY_PASSPHRASE_\K[^=]+')
do
  filename=$(echo "$var" | tr '[:upper:]' '[:lower:]')
  filenameUppercase=$(echo "$var" | tr '[:lower:]' '[:upper:]')
  filePath=~/.ssh/"$filename"
  echo "The SSH env variable $filenameUppercase was found"
  if [ -f "$filePath" ]; then
    echo "Adding the key $filename to the SSH agent"
    ssh-add ~/.ssh/"$filename" $"ANSIBLE_SSH_KEY_PASSPHRASE_$var" || exit 1
    echo "The key $filename was added successfully the SSH agent."
  else
    echo "The env variable $filenameUppercase designs a key file ($filePath) that does not exists"
    exit 1;
  fi
done

echo
# Start the passed command ($*)
/bin/sh -c "$*"
