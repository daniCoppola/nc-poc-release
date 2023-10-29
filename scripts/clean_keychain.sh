#!/bin/bash

if [ $# -eq 1 ]; then
 uid=$1
 secret-tool clear user $uid\_e2e-mnemonic:http://localhost:8080/nextcloud/:0
 secret-tool clear user $uid\_e2e-certificate:http://localhost:8080/nextcloud/:0
 secret-tool clear user $uid\_e2e-private:http://localhost:8080/nextcloud/:0
 secret-tool clear user $uid:http://localhost:8080/nextcloud/:0
 secret-tool clear user $uid\_app-password:http://localhost:8080/nextcloud/:0
 exit
fi

if [ $# -eq 2 ]; then 
 uid=$1
 keyring=$2
 secret-tool clear user $uid\_e2e-$keyring:http://localhost:8080/nextcloud/:0
 exit
fi

echo "Usage: ./clean_keyring.sh <uid> <[app-password/private/mnemonic]>"

