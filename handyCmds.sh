#!/bin/bash

printf "Select an option. \n1)Backup hard disk to /dev/sdb. \n2)Search for all files with suid and guid permission \n3) Check printout of parsed form of magic file. Useful for debugging magic files before installing. \n4)Kills all processes accessing the file system /home. \n5)Find the latest 5 updated packages \n6)Shows the address of a domain. \n7)too lazy to write the rest of instructions. Read the comments for rest of instructions."

read option

# Creates a backup of the hard disk. Useful for sysadmins to create backups.
if [ $option = 1 ]; then
	dd if = /dev/sda of = /dev/sdb;
# Finds all files with suid and guid permisions. Useful to keep track of permissions.
elif [ $option = 2 ]; then	
	find / -perm /6000 -exec ls -ldb {} \;
# Check printout of parsed form of magic file. Useful for debugging magic files before installing.
elif [ $option = 3 ]; then
	file -c;
# Kills all processes accessing the file system /home.
elif [ $option = 4 ]; then
	fuser -km /home;
# Find the latest 5 updated packages
elif [ $option = 5 ]; then
	grep Updated: /var/log/yum.log | tail -5;
# Shows the address of a domain.
elif [ $option = 6 ]; then
	host google.com;
# Looks for unused direct dependencies in this executable
elif [ $option = 7 ]; then
	ldd -u handyCmds.sh;
# Lists opened files by root
elif [ $option = 8 ]; then
	lsof -u root;
# Create a mount point for a usb and mount a usb to it
elif [ $option = 9 ]; then
	mkdir -p /media/usb;
	mount /dev/sdd1 /media/usb;
# Display all of root's processes
elif [ $option = 10 ]; then
	ps -fU root;
# Kills the process "virus" because you don't want viruses running. That's bad.
elif [ $option = 11 ]; then
	pkill virus;
# Displays active TCP connections and the PID every 10 seconds
elif [ $option = 12 ]; then
	netstat -o 10;
# Makes all processes belonging to root very mean to give priority
elif [ $option = 13 ]; then
	renice -n --19 -u root;
# Makes a backup tar file of the home directory and it's subdirectories
elif [ $option = 14 ]; then
	rsync -zvh backup.tar /root;
# Writes to a log how long it takes to update.
elif [ $option = 15 ]; then
	time yum update >> updateTimeLog.txt;
# ssh into hammer server under my account
elif [ $option = 16 ]; then
	ssh echai009@hammer.cs.ucr.edu;
# Displays the current file system status
elif [ $option = 17 ]; then
	stat -f /
# Makes a report for ifconfig
elif [ $option = 18 ]; then
	strace -c ifconfig eth0;
# Outputs everything about your current machine
elif [ $option = 19 ]; then
	uname -a;
# Gets the update for wget
elif [ $option = 20 ]; then
	wget http://ftp.gnu.org/gnu/wget/wget-latest.tar.gz;
fi
