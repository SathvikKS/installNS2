#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run this script as root"
  exit
fi

# Add repository for gcc 4.8 and g++ 4.8
echo "deb http://in.archive.ubuntu.com/ubuntu/ bionic main universe" | sudo tee -a /etc/apt/sources.list

# Install Essentials
sudo apt update 
sudo apt install wget build-essential autoconf automake libxmu-dev gcc-4.8 g++-4.8 -y

# Checks for Java installation
if [ -n `which java` ]; then
  echo "Java is installed."
else
  echo "Java is not installed!. Installing Java"
  sudo apt install default-jre default-jdk -y
fi

# Remove the repository
sudo sed -i '$ d' /etc/apt/sources.list
sudo apt update

# Download and Extract ns-allinone-2.35.tar.gz
mkdir installNS2-SKS
cd installNS2-SKS
wget https://www.dropbox.com/s/ytb6u0aa9q0bsae/ns-allinone-2.35.tar.gz
tar zxvf ns-allinone-2.35.tar.gz
cd ns-allinone-2.35
./install

# Setting up the environmental variables
ns2Path=$(pwd)
echo "export PATH="$ns2Path/bin:$ns2Path/tcl8.5.10/unix:$ns2Path/tk8.5.10/unix:$PATH"" >> ~/.bashrc
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ns2Path/otcl-1.14:$ns2Path/lib
export TCL_LIBRARY=$TCL_LIBRARY:$ns2Path/tcl8.5.10/library


# Download NSG2.jar 
wget -P ~/Desktop https://www.dropbox.com/s/mh3fz35lgatxmq8/NSG2.1.jar

