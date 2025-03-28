Run this to install the latest version of MikroTik CHR
```
bash <(curl -Ls https://raw.githubusercontent.com/mahdi383ir/mikrotik/refs/heads/main/chr-stable.sh)
```
or, Use these commands to install the desired version:
```
wget https://raw.githubusercontent.com/mahdi383ir/mikrotik/refs/heads/main/chr-stable.sh
bash chr-stable.sh <version>
```
In the commands above, replace <version> with your desired version number. For example, the following commands are for installing version 7.16.2.
```
wget https://raw.githubusercontent.com/mahdi383ir/mikrotik/refs/heads/main/chr-stable.sh
bash chr-stable.sh 7.16.2
```
After executing this command, restart the server using the `reboot` command.  
There is a possibility that after entering the `reboot` command, the terminal may return an error, and the server may not restart. In this case, you must perform a hard reboot via the server's management panel.

This script has been tested for the following datacenters and will work with complete confidence:
- [Hetzner](https://www.hetzner.com)
- [Aryananet](https://my.aryananet.com)
- [HostVDS](https://hostvds.com)
- [ParsSafe](https://parssafe.com)
- [Ping0](https://ping0.network)
