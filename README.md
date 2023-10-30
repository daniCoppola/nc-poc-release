# PoC of the attack against Nextcloud E2EE

This repo contains the code for testing the attacks against Nextcloud E2EE. It explains how to create an instance of Nextcloud server that performs the attack, and how to install a client for testing the attacks.

## Getting Started

### Server 
In a folder of your choice execute:
```
mkdir vagrant
cd vagrant
wget https://anonymous.4open.science/r/nc-poc-release-C86D/vagrant/Vagrantfile https://anonymous.4open.science/r/nc-poc-release-C86D/vagrant/install.sh
```
This downloads the vagrant scripts to spawn a virtual machine (VM) with aNextcloud server running on it.
 
The server can be accessed at [http://localhost:8888/nextcloud](http://localhost:8888/nextcloud) (if port 8888 is already being used, change it to a desired one).

Create the VM by executing
```
vagrant up --provision
```
This process may take a while, please bare with me :).

Once the VM is running ssh into the VM (```vagrant ssh```) and execute
```sudo apt-get install -y sagemath```
and follow the installation instruction.

At the end of this process you should be able to acces the server from outside the VM at [http://localhost:8888/nextcloud](http://localhost:8888/nextcloud)/. 
A fresh user account with credentials: username:poc password:X3i69D.XBgId is created for you to log in with a Nextcloud client. 
You can also create other users logging in with the admin account username:admin password:password.

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

### Dependencies

This code requires vagrant (version >= 2.2.19). We tested the PoC on the desktop client running on Ubuntu, however they should also work for other OSes. Simply install the correct client from
[Nextcloud release website.](https://github.com/nextcloud/desktop/releases/download/v3.6.0)

### Running the attacks
The files `notes/key_insertion_attack.md`, `notes/ghosy_key_attack.md`, `notes/IV_reuse.md` contain the description of how to execute each attack.