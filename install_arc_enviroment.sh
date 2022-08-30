#!/bin/bash
echo "### Arc Setup ###################################################################"
echo "#################################################################################"

# System Update
echo -e "\n### System update"
apt-get update
apt-get upgrade

echo -e "\n### Install Arc Agent"
wget https://aka.ms/azcmagent -O ~/Install_linux_azcmagent.sh
bash ~/Install_linux_azcmagent.sh

echo -e "\n### Config Arc Agent"
echo -e "\n>>> Please go to the Azure GUI & add a server with Azure Arc & Get the azcmagent connect command and save the file into bitwarden"
read -p ">>> Press ENTER to continue... "

echo -e "\n>>> Please go to the Edge CLI & insert the azcmagent connect command"
read -p ">>> Press ENTER to continue... "

echo -e "\n### Check Arc Agent"
azcmagent show
read -p ">>> Press ENTER to continue... "

echo -e "\n### Install Azure Monitor Agent"
echo -e "\n>>> Please go to the Azure GUI & create data collection rule (Azure Monitor - Settings/Data Collection Rules)"
echo -e "\n>>> Set the update maintenance scheduler (Azure Maintenance Configurator - Settings/Machines)
read -p ">>> Press ENTER to continue... "

# ps -ef | grep omsagent

echo "### Done :) #####################################################################"
echo "#################################################################################"
