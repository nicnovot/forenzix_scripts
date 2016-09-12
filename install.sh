#Author: Nick Novotny
#Date: April 2016
#Forenzix Install Script

#Built to add Forenzix functionalityto Debian-based Operating Systems.

#Only tested on Kali Linux.

#Add the chain for INetSim
sudo wget -O - http://www.inetsim.org/inetsim.org-archive-signing-key.asc | apt-key add -

#Add repository for INetSim

sudo echo "deb http://www.inetsim.org/debian/ binary/" >> /etc/apt/sources.list

#Populate software updates

sudo apt-get update

sudo apt-get install qemu -y

sudo apt-get install dkms -y

sudo apt-get install virtualbox -y

sudo apt-get install virtualbox-dkms -y

sudo apt-get install dnsmasq -y

sudo apt-get install bc -y


#Get Debian OpenVSwitch Dependencies

#sudo apt-get install graphviz autoconf automake bzip2 debhelper dh-autoreconf libssl-dev libtool openssl procps python-all python-qt4 python-twisted-conch python-zopeinterface -y


#Get OpenVSwitch

#sudo wget http://openvswitch.org/releases/openvswitch-2.5.0.tar.gz

#Decompress the tarball prior to installation

#sudo tar xzvf openvswitch-2.5.0.tar.gz

#cd openvswitch-2.5.0
#install additional needed tools
#sudo apt-get install build-essential fakeroot -y

#Build the *.deb packages
#sudo fakeroot debian/rules binary

#Install INetSim
sudo apt-get install inetsim -y


## Move scripts into the correct directories and finish configuration

cd /
sudo cp *.sh /usr/local/sbin

sudo echo alias cap="capture.sh" >> ~/.bash_aliases

sudo echo alias vlz="virtualize.sh" >> ~/.bash_aliases


##Configuration is completed