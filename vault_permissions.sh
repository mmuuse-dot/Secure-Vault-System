#!/bin/bash

VAULT_DIR="$HOME/secure_vault"

if [ ! -d "$VAULT_DIR" ]; then
  echo "❌ secure_vault does not exist. Run vault_setup.sh first."
  exit 1
fi

update_perm() {
  FILE=$1
  DEFAULT=$2

  echo
  ls -l "$VAULT_DIR/$FILE"
  read -p "Update permission for $FILE? (y/n): " answer

  if [ "$answer" = "y" ]; then
    read -p "Enter new permission (e.g. 600): " perm

    if [ -z "$perm" ]; then
      chmod "$DEFAULT" "$VAULT_DIR/$FILE"
      echo "Default permission applied."
    else
      chmod "$perm" "$VAULT_DIR/$FILE"
    fi
  else
    read -p "Press Enter to apply default ($DEFAULT) or type anything to skip: " skip
    if [ -z "$skip" ]; then
      chmod "$DEFAULT" "$VAULT_DIR/$FILE"
    fi
  fi
}

update_perm keys.txt 600
update_perm secrets.txt 640
update_perm logs.txt 644

echo
echo "Final permissions:"
ls -l "$VAULT_DIR"

