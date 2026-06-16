!#/bin/bash


# Paketenmamngmant 
apt upgrade -y
apt update -y
apt install tree firefox -y 

#User Managent
for user in mimi lalo pepa; do useradd -r "$user"; done
for gruop in ag arbeiter; do addgroup "$group" ; done

usermod -aG  ag lalo 
usermod -aG  arbeiter mimi 
usermod -aG  arbeiter pepa

mkdir /home/lalo/ag/kasse  
mkdir /home/lalo/ag/personal/credentials
mkdir /home/lalo ag/personal/Zeiten 
mkdir /home/lalo/logs

#rechte und Passwörter vergeben
chown -R  lalo:lalo /home/lalo/ag /home/lalo/logs
cd /home/lalo/ag/personal/
git clone  git@github.com:MiguelitoMe/credentials-FI.git

cat /home/lalo/ag/personal/credentials-FI.git | chpasswd



#cronjob
echo "@reboot" date >> /home/lalo/logs/reboot.log  | crontab -u lalo  
 
#alias  erstellen

echo "alias 'rb=reboot' " >> /home/lalo/.bashrc

echo "Der Script ist fertig"

for i in {5..1}; do 
    echo "$i..."
    sleep 1
 done

echo "Computer startet neu"
reboot

  



























