<center>
  <h1>ApacheSetupScript (for a school project)</h1>
  <h3>A small script to automatically install Apache2 and change its configuration</h3>
</center>

&nbsp;

## Usage

To download the setup script, run the following commands :

```bash
wget https://raw.githubusercontent.com/Spokelax/ApacheSetupScript/main/download.sh
```

```bash
bash download.sh
```

&nbsp;

Downloading and executing `download.sh` script will :

1. Download and unzip the contents of apache.zip from the main repo
2. Execute the main script `apache_script.sh` that performs the apache installation
3. Install Apache2
4. Stop the Apache2 service to configure the installation
5. Create a `test` user with the password `1234` (to acess apache private repository)
6. Move the `000-default.conf` file and the contents of the `/var/www/html/` directory to the appropriate locations
7. Start the Apache2 service to make the changes effective
8. Delete any leftover files, leaving only the main script for uninstallation

> Also, after installation, every files such as `000-default.conf` and `index.html` will be deleted, so using `bash apache_script.sh install [password]` won't work again.

> Note :
During installation, a private directory called `private` will be created at the root of the Apache server. The default username and password for the directory are set to `test` and `1234`.

&nbsp;

## Removal

To uninstall Apache, you can use the `apache_script` script with the uninstall option.<br>
> Note : I forgot to remove the 2 arguments restriction for uninstallation, so because of lazyness i'm using an `x` varaible.

```bash
bash apache_script uninstall x
```
