#!/bin/bash

GROUP="developers"
NAMES_FILE=${1:-first_names.csv}
PUBLIC_KEY_FILE="aux_id_rsa.pub"

function create_user() {
  sudo useradd -m $1
}

while read -r NAME; do
  # Skip if user exist
  if id $NAME &>/dev/null; then
    echo "user $NAME exists, skipping operation."
    continue
  fi

  echo "Creating user with name: ${NAME}"
  create_user $NAME

  echo "Adding user to group: ${GROUP}"
  sudo usermod $NAME -a -G $GROUP

  USER_SSH_PATH="/home/${NAME}/.ssh"
  if ! test -d $USER_SSH_PATH; then
    echo ".ssh folder does not exist, creating .ssh folder for ${NAME}"
    sudo mkdir "${USER_SSH_PATH}"
  fi

  USER_AUTHORIZED_KEY_FILE="${USER_SSH_PATH}/authorized_keys"
  if ! test -f "$USER_AUTHORIZED_KEY_FILE"; then
    echo "authorized_keys file does not exist, creating authorized_keys file for ${NAME}"
    sudo touch "${USER_AUTHORIZED_KEY_FILE}"
  fi

  # authorized_keys file is owned by root
  sudo chown -R $NAME:$NAME $USER_SSH_PATH

  echo "Adding public key to authorized_keys file for user ${NAME}"
  CURRENT_USER_PUB_KEY="/home/${USER}/auxiliary-projects/Shell/${PUBLIC_KEY_FILE}"
  sudo cat $CURRENT_USER_PUB_KEY | sudo tee $USER_AUTHORIZED_KEY_FILE > /dev/null

  echo "..."
done < $NAMES_FILE
