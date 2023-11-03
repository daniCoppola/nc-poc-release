## Description
We refer to the paper for the attack description. 

## Steps to reproduce the vulnerability

The server deployed in the VM is running version 24 of the Nexcloud server. 
The server code was modified in the following ways:
- the server adds a chosen metadata key encrypted under the user's public key to the folder metadata.
- a python script is notified on each file upload. The script is responsible for decrypting the uploaded files.
The server code can be found in the folder /var/www/nextcloud.
The modification made to the server code can be seen by looking at the git history and are also enclosed in the code with comments 
"// BEGIN ATTACK CODE" and "// END ATTACK CODE".

Attack setup:
  1. SSH into the server
  2. Change directory to /var/www/nextcloud/poc
  3. Start the script attack_server.py executing the command 
        ```sudo python3 attack_server.py e2e_add_metadata_key```

The script will decrypt the uploaded metadata and files using the chosen metadata key. 

Steps to reproduce:
    1. Connect with your desktop client to http://localhost:8888/nextcloud  with credentials: `username:poc` and `password:X3i69D.XBgId` 
    2. Create a folder and mark it as end-to-end encrypted
    3. Create a text file in the folder and let the client sync
The python script will display the recovered plaintext. 
Note in the displayed metadata that the folder metadata contains an additional metadata key.
