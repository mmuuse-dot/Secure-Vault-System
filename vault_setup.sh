#!/bin/bash

VAULT_DIR="$HOME/secure_vault"

mkdir -p "$VAULT_DIR"

echo "Welcome to Secure Vault - Keys File" > "$VAULT_DIR/keys.txt"
echo "Welcome to Secure Vault - Secrets File" > "$VAULT_DIR/secrets.txt"
echo "Welcome to Secure Vault - Logs File" > "$VAULT_DIR/logs.txt"

echo "✅ Secure Vault initialized successfully!"

ls -l "$VAULT_DIR"

