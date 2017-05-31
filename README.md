# forenzix_scripts

This repository houses the scripts associated with the Kali fork called Forenzix.  The scripts contained in the repository are
being composed for a custom iso of Kali Linux by Offensive Security(R).  The idea was developed when BackTrack Linux was still
in development.  The purpose of this custom live iso (distro) is to be placed on a high-capacity USB flash drive with 2 partitions.
  One of these partitions should be for the live iso.  The other partition will be used for evidence capture.
      
The purpose of Forenzix is to provide an Incident Responder responding to botnet infection with a ready-made tool to create a new
investigation file (essentially time stamps and a record of the specifics of the investigation), capture a raw image of the
evidenciary HDD, perform MD5, SHA1, and SHA256 hashes, and record everything in the investigation file.

Once the capture has been completed, the raw image is converted to the vmdk format and a Virtual Machine is created in Virtualbox
with the vmdk file as its primary hard drive, then connect the virtual machine to Inetsim (inetsim.com) and begin a packet capture
to capture the communications' destination and develop a new signature definition for IDS/IPS, future incident response plans,
and threat intelligence activities.
