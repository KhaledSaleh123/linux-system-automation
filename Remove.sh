#!/bin/bash



for user in mostafa ali;do userdel -r "$user";done
 
for group in verwaltung music;do groupdel  "$group";done
