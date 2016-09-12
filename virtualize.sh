#Author: Nick Novotny

#Date: April 2016

#Name: Forenzix Virtualize Script

#This script will convert the raw capture to vmdk format fingerprint and create a virtual machine with RAM and the virtual HDD, connect a vNIC to open vSwitch and INetSim.

#Specify bash as the shell in which this script will run.

#!/bin/bash
casename="investigation2Notes.notes"
#CHANGE THIS TO MATCH YOUR CURRENT CASE NAME!!!!!


echo "Evidence SHA256 hash:" | tee -a $casename


date | tee -a $casename

sha256sum capture.raw | tee -a $casename


date | tee -a $casename


echo "Raw->vmdk conversion started." | tee -a $casename


date | tee -a $casename


VBoxManage convertdd capture.raw capture.vmdk --format VMDK


date | tee -a $casename


echo "Raw->vmdk conversion completed." | tee -a $casename


date | tee -a $casename


#echo $hash_method, $hash_value of raw format

echo "vmdk files MD5 hash:" | tee -a $casename


date | tee -a $casename


md5sum capture.vmdk | tee -a $casename


date | tee -a $casename


echo "vmdks SHA1 Hash:" | tee -a $casename


date | tee -a $casename


sha1sum capture.vmdk | tee -a $casename


date | tee -a $casename


echo "vmdks SHA256 hash:" | tee -a $casename


date | tee -a $casename


sha256sum capture.vmdk | tee -a $casename


#echo converting back to raw format


echo "VMDK verification being performed. Converting back to raw to verify." | tee -a $casename


#echo "VMDK verification being performed. Converting back to raw to verify."


date | tee -a $casename


VBoxManage clonehd capture.vmdk capture1.raw --format RAW


echo "vmdk->raw conversion completed." | tee -a $casename


date | tee -a $casename


#echo $hash_method, $hash_value of raw converted disk


echo "MD5 hash of converted raw file:" | tee -a $casename


date | tee -a $casename


md5sum capture1.raw | tee -a $casename


date | tee -a $casename


echo "SHA1 hash of converted raw file:" | tee -a $casename


sha1sum capture1.raw | tee -a $casename


date | tee -a $casename


echo "SHA256 hash of converted raw file:" | tee -a $casename


sha256sum capture1.raw | tee -a $casename


date | tee -a $casename


echo "Capture completed.  VM starting." | tee -a $casename


date | tee -a $casename


#echo "This is where the Virtual Machine would start."


#Get the RAM for the Virtual Machine

ram=$(dmidecode -t 17 | grep "Size.*MB" | awk '{s+=$2} END {print s}')


#This works in terminal manual entry, but the bash script fails due to improper redirect.

vram=$(bc<<<$(($ram*75/100)))


#Virtualbox create VM


VBoxManage createvm --name "CompromisedMachine" --register


#VBoxManage to attach a hard drive

VBoxManage storageattach --type hdd --medium "capture.vmdk"


#VBoxManage to add the correct amount of memory

VBoxManage modifyvm "CompromisedMachine" --memory $(echo $vram)


#./VBoxManage modifyvm networking

#start connected to OpenVSwitch