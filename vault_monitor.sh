#!/bin/bash

VAULT="$HOME/secure_vault"
REPORT="$VAULT/vault_report.txt"

> "$REPORT"

for file in "$VAULT"/*; do
  name=$(basename "$file")
  size=$(stat -c %s "$file")
  modified=$(stat -c %y "$file")
  perms=$(stat -c %a "$file")

  echo "File: $name" >> "$REPORT"
  echo "Size: $size bytes" >> "$REPORT"
  echo "Last Modified: $modified" >> "$REPORT"
  echo "Permissions: $perms" >> "$REPORT"

  if [ "$perms" -gt 644 ]; then
    echo "⚠️ SECURITY RISK DETECTED" >> "$REPORT"
  fi

  echo "------------------------" >> "$REPORT"
done

echo "✅ Vault security report created at $REPORT"

