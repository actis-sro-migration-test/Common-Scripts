#!/bin/bash
set -exuo pipefail
IFS=$'\n\t'

# check if needed commands are installed
if ! command -v curl &>/dev/null; then
    echo "Command 'curl' not present. Please install."
fi
if ! command -v jq &>/dev/null; then
    echo "Command 'curl' not present. Please install."
fi

# functions
function usage() {
    echo "$0 VAULT_URL VAULT_DEST VAULT_USER VAULT_PASS OUTPUT"
    echo "VAULT_URL: URL of Vault instance, with protocol (http/https)"
    echo "VAULT_DEST: in which KV is the value stored, value of 'cert' will be read from this location"
    echo "VAULT_USER: username with which to authenticate"
    echo "VAULT_PASS: password with which to authenticate"
    echo "OUTPUT: where should the certificate be saved to"
}

# inputs
VAULT_URL=$1
VAULT_DEST=$2
VAULT_USER=$3
VAULT_PASS=$4
OUTPUT=$5

# validation
if [ -z "$VAULT_URL" ] || [ -z "$VAULT_DEST" ] || [ -z "$VAULT_USER" ] || [ -z "$VAULT_PASS" ] || [ -z "$OUTPUT" ]; then
    usage
    echo "Wrong usage!"
    exit 1
fi
if [ -d "$OUTPUT" ] || [ -f "$OUTPUT" ]; then
    echo "The file $OUTPUT already exists!"
    exit 1
fi

# logic
# fetch token
token=$(curl -s --insecure -X POST "${VAULT_URL}/v1/auth/userpass/login/${VAULT_USER}" -H "accept: */*" -H "Content-Type: application/json" -d "{\"password\":\"${VAULT_PASS}\"}" | jq -r .auth.client_token)

# fetch and save the cert
cert_json=$(curl -s --insecure -X GET "${VAULT_URL}/v1/kv/data/${VAULT_DEST}" -H "accept: */*" -H "X-Vault-Token: $token")
echo "$cert_json" | jq .data.data.cert | sed 's/\"//g' | sed 's/\\n/\n/g' >"$OUTPUT"
echo "Certificate saved at '$OUTPUT'."
