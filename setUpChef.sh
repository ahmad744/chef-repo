 #!/bin/bash

set -e

if [[ $EUID -ne 0 ]]; then
   echo "You must run this script as root." 1>&2
   exit 100
fi

# Downloading Chef Development Kit
wget -v https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.10.0-1_amd64.deb
if [[ $? -ne 0 ]]; then
	echo "Chef DK download failed, error code=" $?
	exit 100
fi
echo "Chef DK download successful. Installing it now..."

# Installing Chef Development Kit
sudo dpkg -i chefdk_0.10.0-1_amd64.deb
if [[ $? -ne 0 ]]; then
	echo "Chef DK installation failed, error code=" $?
	exit 100
fi
echo "Chef DK has been installed. Now verifying the installation..."

# remove installation file
sudo rm -rf chefdk_0.10.0-1_amd64.deb
echo "Chef DK installation file has been removed."

# Verifying the installation
sudo chef verify
if [[ $? -ne 0 ]]; then
	echo "Chef DK configuration failed, error code=" $?
	exit 100
fi
echo "Verification complete."
