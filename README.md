# PoC of the attacks against Nextcloud E2EE

This repo contains the code for testing the attacks against Nextcloud E2EE. It explains how to create an instance of Nextcloud server that performs the attack, and how to install a client for testing the attacks. The attacks work against v3.6 of Nextcloud client, and were all patched as of v3.8. 

## Getting Started

### Server 
In a folder of your choice execute:
```
mkdir vagrant
cd vagrant
wget https://anonymous.4open.science/r/nc-poc-release-C86D/vagrant/Vagrantfile https://anonymous.4open.science/r/nc-poc-release-C86D/vagrant/install.sh
```
This downloads the vagrant scripts to spawn a virtual machine (VM) with a Nextcloud server running on it.
 
The server can be accessed at [http://localhost:8888/nextcloud](http://localhost:8888/nextcloud) (if port 8888 is already being used, change it to a desired one).

Create the VM by executing
```
vagrant up --provision
```
This process may take a while, please bare with me :).

Once the VM is running, ssh into the VM (```vagrant ssh```) and execute
```sudo apt-get install -y sagemath```
and follow the installation instruction.

At the end of this process you should be able to acces the server from outside the VM at [http://localhost:8888/nextcloud](http://localhost:8888/nextcloud)/. 
A fresh user account with credentials: username:poc password:X3i69D.XBgId is created for you to log in with a Nextcloud client. 
You can also create other users logging in with the admin account username:admin password:password or with the script [create_user.sh](https://anonymous.4open.science/r/nc-poc-release-C86D/scripts/create_user.sh).

### Client
Our attacks are performed against the version 3.6 of Nextcloud client. 
The easiest way to run such client is download the corresponding release on an Ubuntu machine by executing
```
wget https://github.com/nextcloud/desktop/releases/download/v3.6.0/Nextcloud-3.6.0-x86_64.AppImage
chmod +x Nextcloud-3.6.0-x86_64.AppImage
```

Execute the AppImage as
```
./Nextcloud-3.6.0-x86_64.AppImage
```
and perform the login at [http://localhost:8888/nextcloud](http://localhost:8888/nextcloud) with credentials: `username:poc` and `password:X3i69D.XBgId` (or another account if you created a new one).

### End-to-End Encryption
Make sure to enable E2EE. To enable E2EE encryption:
- Open the menu by clicking on the top left corner on the username
- Click on settings
- Click on enable encryption

The settings window is also the window where empty folders can be marked as E2EE.
Folders can be marked as E2EE only if empty. 
To mark a folder as E2EE right click on the folder and select "encrypt".

### Dependencies

This code requires vagrant (version >= 2.2.19). We tested the PoC on the desktop client running on Ubuntu, however they should also work for other OSes. Simply install the correct client from
[Nextcloud release website.](https://github.com/nextcloud/desktop/releases/download/v3.6.0)

### Running the attacks
The files 
- [key_insertion_attack.md](https://anonymous.4open.science/r/nc-poc-release-C86D/notes/key_insertion_attack.md)
- [ghost_key_attack.md](https://anonymous.4open.science/r/nc-poc-release-C86D/notes/ghost_key_attack.md)
- [IV_reuse.md](https://anonymous.4open.science/r/nc-poc-release-C86D/notes/IV_reuse.md)

contain the description of how to execute each attack.
