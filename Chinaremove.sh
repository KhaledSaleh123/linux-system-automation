#!bin/bash

for user in hao xinzhao xiaomi;do userdel -r "$user";done
for group in party arbeiter;do groupdel "$group"; done
for pkg in tree neowofetch;do apt purge -y "$pkg";done
apt autoremove -y 
