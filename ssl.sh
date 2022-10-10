#A script which helps to automates ssl certificate on a website {at no cost}.
#Preresiquetes - existing domain name

clear
echo "Would you like to install cert-bot and & create secure website?"
read -p "Please press [Enter] to continue or [n] for not: " x
if [[ $x = '' ]]
then
  sudo apt install snapd -y
  sudo snap install core && sudo snap refresh core
  sudo snap install --classic certbot
  sudo ln -s /snap/bin/certbot /usr/bin/certbot
fi
read -p "Please press [Enter] to continue..." x
clear
echo "Please enter the name of the website you wish to secure "
read -p "for example example.com (without www or http) and press [Enter]: " x
if [[ $x != '' ]]
then
 sudo certbot --apache -d $x -d www.${x}
 sudo certbot renew --dry-run
fi
clear
