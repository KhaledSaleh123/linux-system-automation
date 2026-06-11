#!/bin/bash


for user in takashi miyamoto sakura;do userdel -r "$user";done
 
for group in judo karate trainer;do groupdel  "$group";done


apt purge vlc neowofetch 
apt autoremove -y

