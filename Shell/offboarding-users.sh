#!/bin/bash

NAMES_FILE=${1:-first_names.csv}

while read -r NAME; do
  sudo userdel -r $NAME
done < $NAMES_FILE
