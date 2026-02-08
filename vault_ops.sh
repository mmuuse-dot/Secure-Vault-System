#!/bin/bash

VAULT="$HOME/secure_vault"

while true; do
  echo
  echo "===== SECURE VAULT MENU ====="
  echo "1) Add Secret"
  echo "2) Update Secret"
  echo "3) Add Log Entry"
  echo "4) Access Keys"
  echo "5) Exit"
  read -p "Choose option: " choice

  case $choice in
    1)
      read -p "Enter secret: " secret
      echo "$secret" >> "$VAULT/secrets.txt"
      echo "Secret added."
      ;;

    2)
      read -p "Text to replace: " old
      read -p "New text: " new

      if grep -q "$old" "$VAULT/secrets.txt"; then
        sed -i "s/$old/$new/g" "$VAULT/secrets.txt"
        echo "Secret updated."
      else
        echo "No match found."
      fi
      ;;

    3)
      echo "$(date '+%Y-%m-%d %H:%M:%S') - Log entry added" >> "$VAULT/logs.txt"
      echo "Log recorded."
      ;;

    4)
      echo "ACCESS DENIED 🚫"
      ;;

    5)
      echo "Exiting..."
      exit 0
      ;;

    *)
      echo "Invalid option."
      ;;
  esac
done

