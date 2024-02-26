#!/bin/bash
echo "### Edge Hub Setup ##############################################################"
echo "Detailed info: https://docs.microsoft.com/en-us/azure/iot-edge/how-to-provision-single-device-linux-symmetric?view=iotedge-2020-11&tabs=azure-portal%2Cubuntu"

# System Update
echo -e "\n### System update"
apt-get update
apt-get upgrade

echo -e "\n### Prepare Edge Setup"
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install moby-engine

echo -e "\n### Check Edge Setup (Repository & GPG Key)"
cat /etc/apt/sources.list.d/microsoft-prod.list
file /etc/apt/trusted.gpg.d/microsoft-prod.gpg
read -p ">>> Press ENTER to continue... "

echo -e "\n### Install Edge"
apt-get install aziot-edge defender-iot-micro-agent-edge

echo -e "\n### Check Edge Version"
iotedge -V
read -p ">>> Press ENTER to continue... "

echo -e "\n### Config Edge"
echo -e "\n>>> Please go to the Azure CLI & Create the device with the following sample command:"
echo "az account set --subscription ec95e20b-638e-493b-93b9-a78f54cbe6b2"
echo "az iot hub device-identity create --device-id <machine identifier> --hub-name iot-stdpe-iot-prod --edge-enabled"
read -p ">>> Press ENTER to continue... "

echo -e "\n>>> Please go to the Azure CLI & Get the connection string with the following sample command:"
echo "az iot hub device-identity connection-string show --device-id <machine identifier> --hub-name iot-stdpe-iot-prod"
read -p ">>> Press ENTER to continue... "

echo -e "\n>>> Please go to the Edge CLI & insert the connection string with the following sample command:"
echo "az iotedge config mp --connection-string '<connection-string>'"
read -p ">>> Press ENTER to continue... "

iotedge config apply -c '/etc/aziot/config.toml'
iotedge system restart

echo -e "\n### Check Edge Status"
iotedge system status
iotedge list
# iotedge check
# iotedge system logs
read -p ">>> Press ENTER to continue... "

echo "### Done :) #####################################################################"
echo "#################################################################################"
