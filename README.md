Run this to install the latest version of MikroTik CHR
```
bash <(curl -Ls https://raw.githubusercontent.com/mahdi383ir/mikrotik/refs/heads/main/chr-stable.sh)
```
After executing this command, restart the server using the `reboot` command.  
There is a possibility that after entering the `reboot` command, the terminal may return an error, and the server may not restart. In this case, you must perform a hard reboot via the server's management panel.

This script has been tested for the following datacenters and will work with complete confidence:
- [Hetzner](https://www.hetzner.com)
- [Aryananet](https://my.aryananet.com)
- [HostVDS](https://hostvds.com)
- [ParsSafe](https://parssafe.com)
- [Ping0](https://ping0.network)
