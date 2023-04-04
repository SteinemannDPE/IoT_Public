echo "### IoT Edge module setup. ###"

echo "\n### Setup BlobstorageLogger"
echo "Create direcotry for local csv storage"

sudo mkdir -p /etc/iotedge/blobStorageLogger
sudo mkdir -p /etc/iotedge/blobStorageLogger/cache
sudo chmod 777 /etc/iotedge/blobStorageLogger
sudo chmod 777 /etc/iotedge/blobStorageLogger/cache

echo "\n### Setup OpcConfigurator"
sudo mkdir -p /etc/iotedge/appdata
sudo chmod a+rwx /etc/iotedge/appdata
