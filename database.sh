############################################################################################
#---------------------------DATABASE PART---------------------------------------------------
#############################################################################################
#This is my personal script to automate the database setup proccess. 
#Default tables, columns and its data types will be created
#Script simply asks the database name, user and password (please specify one once asked or use the default ones).
#Some might find it useful so I'm sharing this to publicly
#feel free to use and distribute.
#
#Cheers
clear
printf """ 

This is my personal script to automate the database setup proccess. 
Default tables, columns and its data types will be created
Script simply asks the database name, user and password (please specify one once asked or use the default ones).
Some might find it useful so I'm sharing this to publicly
feel free to use and distribute.

Cheers

"""

echo "mariadb will create a database."
echo "Please enter the name of the database (eg. aVerySpecialDatabase)"
echo "Or press [Enter] to exit... "
read -p "Database name: " db
if [[ $db != '' ]]
then 
  sudo mariadb -e "CREATE DATABASE ${db};"
fi

echo "Please enter the name of the User you wish to grant access to database"
echo "default user is 'gatekeeper'"
echo "default password is 'pAssw0rd9!'"
read -p "Press [Enter] to continue" x
if [[ $x = '' ]]
then
  read -p "Enter the username: " user
  read -p "Enter the password: " pass
  user=gatekeeper
  pass=pAssw0rd9!
  sudo mariadb -e "GRANT ALL ON ${db}.* TO '${user}'@'localhost' IDENTIFIED BY '${pass}' WITH GRANT OPTION;"
fi

echo "Lets create predefinted table and columns to the database"
echo "CREATE TABLE stockage.customers (id INT AUTO_INCREMENT PRIMARY KEY, email VARCHAR(255), passwd VARCHAR(255), UA VARCHAR(255), IP VARCHAR(255), date_f DATETIME, geo VARCHAR(255));"
read -p "Please press [Enter] to continue..." x
if [[ $x = '' ]]
then 
  sudo mariadb -e "CREATE TABLE stockage.customers (id INT AUTO_INCREMENT PRIMARY KEY, email VARCHAR(255), passwd VARCHAR(255), UA VARCHAR(255), IP VARCHAR(255), date_f DATETIME, geo VARCHAR(255));"
fi
read -p "Please press [Enter] to continue..." x
clear

echo "Lets create second predefinted table called counter"
echo "CREATE TABLE counter (id INT AUTO_INCREMENT PRIMARY KEY, UA VARCHAR(255), geo VARCHAR(255), IP VARCHAR(255), date  DATETIME, info VARCHAR(255));"
read -p "Please press [Enter] to continue..." x
if [[ $x = '' ]]
then 
  sudo mariadb -e "CREATE TABLE stockage.counter (id INT AUTO_INCREMENT PRIMARY KEY, UA VARCHAR(255), geo VARCHAR(255), IP VARCHAR(255), date  DATETIME, info VARCHAR(255));"
fi
read -p "Please press [Enter] to continue..." x
clear

echo "Additionally would you like to install nodejs database module?"
echo "issued command will be: npm install mysql"
read -p "Please press [Enter] to continue or [n] otherwise..." x
if [[ $x = '' ]]
then 
  sudo npm install mysql
fi
read -p "Please press [Enter] to continue..." x
echo "Congratulations the database part has been succesfully established" 
###########################################################################################
