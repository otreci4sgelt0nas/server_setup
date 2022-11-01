##################### Setting Up The User ##############################
#This is my personal script to automate the user setup proccess,
#to elevate tedious password requests and only use ssh key for the logins.
#Script simply asks user and password (please specify one once asked or use the default ones).
#Some might find it useful so I'm sharing this to publicly
#feel free to use and distribute.
#
#Cheers

clear
printf """

This is my personal script to automate the user setup proccess,
to elevate tedious password requests and only use ssh key for the logins.
Script simply asks user and password (please specify one once asked or use the default ones).
Some might find it useful so I'm sharing this to publicly
feel free to use and distribute.

Cheers

"""

echo "We would need to add default user named 'santasHelper' and password 'pAssw0rd1!cring3' or else please specify"
read -p "Please press [Enter] for santasHelper or please specify the username... " userx
read -p "Please press [Enter] for default password or please specify one... " passx
if [[ $userx = '' ]]
then
  userx=santasHelper
  passx=pAssw0rd1!cring3
  adduser $userx --gecos "" --disabled-password && echo $userx:$passx | chpasswd && usermod -aG sudo $userx
else
  adduser $userx --gecos "" --disabled-password && echo $userx:$passx | chpasswd && usermod -aG sudo $userx
fi
read -p "Please press [enter] to continue... " y
clear
##################### copying authorized_keys to user dir ################
echo "We would need to add authorized_keys file to user's directory"
read -p "Please press [Enter] for santasHelper or please specify the username... " x
if [[ $x = '' ]]
then
  mkdir /home/$userx/.ssh
  cp /root/.ssh/authorized_keys /home/$userx/.ssh/authorized_keys
  chown $userx:$userx /home/$userx/.ssh/authorized_keys
fi
read -p "Please press [enter] to continue... " y
clear
#######################################################################
##################### Disabling password logins ##############################
echo "We would need to disable user and root logins by password"
read -p "Please press [Enter] for santasHelper or please specify the username... " x
if [[ $x = '' ]]
then 
  sed -i 's/ChallengeResponseAuthentication[[:space:]]yes/ChallengeResponseAuthentication no/g' /etc/ssh/sshd_config
  sed -i 's/PasswordAuthentication[[:space:]]yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
  sed -i 's/UsePAM[[:space:]]yes/UsePAM no/g' /etc/ssh/sshd_config
  sed -i 's/PermitRootLogin[[:space:]]yes/PermitRootLogin no/g' /etc/ssh/sshd_config
  /etc/init.d/ssh reload
fi
read -p "Please press [enter] to continue... " y
clear
#######################################################################
