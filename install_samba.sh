#!/bin/bash

# Mettre à jour le système
apt-get update

apt-get upgrade -y

# Installer Samba
DEBIAN_FRONTEND=noninteractive apt-get install -y samba samba-common acl

# Déplacer le fichier smb.conf vers l'emplacement correct
mv /tmp/smb.conf /etc/samba/smb.conf

adduser --no-create-home --disabled-login --gecos "" samba_share_user
(echo "password"; echo "password") | smbpasswd -s -a samba_share_user
groupadd samba
gpasswd -a samba_share_user samba

mkdir -p /srv/samba/private/
mkdir -p /srv/samba/partages/
setfacl -R -m "g:samba:rwx" /srv/samba/private/

# Redémarrer le service Samba pour appliquer les changements
systemctl restart smbd nmbd