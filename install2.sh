# !/usr/bin/env bash
# Auto install Mikrotik CHR (Latest Stable or Specific Version)
# by @mahdi_383ir (Telegram)
# Must be root!
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

echo "Preparation ..."
apt install unzip curl -y

# Get specified version or fetch the latest stable version
if [[ -n "$1" ]]; then
    CHR_VERSION="$1"
    echo "Using specified version: $CHR_VERSION"
else
    echo "Fetching the latest MikroTik CHR Stable version..."
    CHR_VERSION=$(curl -s https://mikrotik.com/download | grep -oP 'chr-\K[0-9]+\.[0-9]+\.[0-9]+(?=\.img\.zip)' | sort -V | tail -n 1)
    if [ -z "$CHR_VERSION" ]; then
       echo "Failed to fetch the latest version. Please check your internet connection or the MikroTik website."
       exit 1
    fi
    echo "Latest Stable CHR Version found: $CHR_VERSION"
fi

# Detect disk and network information
DISK=$(lsblk | grep "disk" | head -n 1 | awk '{print $1}')
INTERFACE=$(ip -o -4 route show to default | awk '{print $5}')
INTERFACE_IP=$(ip addr show $INTERFACE | grep global | awk '{print $2}' | head -n 1)
INTERFACE_GATEWAY=$(ip route show | grep default | awk '{print $3}')

# Download and extract CHR
echo "Downloading RouterOS CHR version $CHR_VERSION ..."
wget -qO routeros.zip https://download.mikrotik.com/routeros/$CHR_VERSION/chr-$CHR_VERSION.img.zip
if [[ $? -ne 0 ]]; then
    echo "Download failed. Please check the version number or your internet connection."
    exit 1
fi

unzip routeros.zip && rm -rf routeros.zip

# Prepare for installation
mount -o loop,offset=512 chr-$CHR_VERSION.img /mnt

# Set initial CHR configuration
echo "/ip service disable api
/ip address add address=${INTERFACE_IP} interface=[/interface ethernet find where name=ether1]
/ip route add gateway=${INTERFACE_GATEWAY}
" > /mnt/rw/autorun.scr

umount /mnt
echo u > /proc/sysrq-trigger
dd if=chr-$CHR_VERSION.img of=/dev/${DISK} bs=100M

echo "Installation completed. Please reboot the system to start MikroTik CHR $CHR_VERSION."
