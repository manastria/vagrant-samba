# README.md for Debian Samba VM Setup

## Introduction

This project is a simple Vagrant setup to provision a Debian Buster virtual machine with Samba pre-installed and configured. It includes:

- A `Vagrantfile` to configure the VM.
- A shell script (`install_samba.sh`) to install and configure Samba.
- A Samba configuration file (`smb.conf`).

## Prerequisites

- Vagrant
- VirtualBox

## Usage

1. Clone this repository.
   ```bash
   git clone [repository-url]
   cd [repository-folder]
   ```

2. Run Vagrant to provision the VM.
   ```bash
   vagrant up
   ```

3. To access the VM:
   ```bash
   vagrant ssh
   ```

## Existing Shares

The Samba configuration file (`smb.conf`) specifies the following existing shares:

### Homes

This share is for home directories.

- **Path**: Automatically set to each user's home directory
- **Access**: Valid users only
- **Writeable**: Yes
- **Guest Access**: No

```ini
[homes]
   comment = Home Directories
   browseable = no
   read only = no
   create mask = 0700
   directory mask = 0700
   valid users = %S
```

### Private

This share is for files that require username and password for access.

- **Path**: `/srv/samba/private/`
- **Access**: Valid users in the `samba` group
- **Writeable**: Yes
- **Guest Access**: No

```ini
[Private]
   comment = needs username and password to access
   path = /srv/samba/private/
   browseable = yes
   guest ok = no
   writable = yes
   valid users = @samba
```

### Partages

This is a public read-only directory.

- **Path**: `/srv/samba/partages/`
- **Access**: Anyone
- **Writeable**: No
- **Guest Access**: Yes

```ini
[Partages]
   comment = Public read-only directory
   path = /srv/samba/partages/
   browseable = yes
   guest ok = yes
   writable = no
```

For additional configurations and to create more shares, you can modify the `smb.conf` file and restart the Samba services using:

```bash
systemctl restart smbd nmbd
```

## Contributing

Feel free to create issues and open pull requests to improve the project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to adjust the README as per your project's needs.