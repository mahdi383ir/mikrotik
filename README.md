Run this to install the latest version of MikroTik CHR
```
bash <(curl -Ls https://raw.githubusercontent.com/mahdi383ir/mikrotik/refs/heads/main/install.sh)
```
or, Use these command to install the desired version:
```
bash <(curl -Ls https://raw.githubusercontent.com/mahdi383ir/mikrotik/refs/heads/main/install.sh) <version>
```
In the command above, replace <version> with your desired version number. For example, the following command are for installing version 7.25.1.
```
bash <(curl -Ls https://raw.githubusercontent.com/mahdi383ir/mikrotik/refs/heads/main/install.sh) 7.25.1
```

> **Note:** If you did not enable automatic sysrq reboot in the script, restart the server using the `reboot` command after execution. If the terminal returns an error due to disk overwrite, perform a hard reboot via your server's management panel.

This script has been tested on the following datacenters and works reliably:
- [Hetzner](https://www.hetzner.com)
- [Aryananet](https://my.aryananet.com)
- [HostVDS](https://hostvds.com)
- [ParsSafe](https://parssafe.com)
- [Ping0](https://ping0.network)
- [Netlen](https://netlen.com)
