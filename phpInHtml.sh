clear
printf """
this script intention to remove .php, .html, .htm extensions with .htaccess
please run it with sudo permission
it will edit apache configuration edit file by adding 

'<Directory /var/www/your_domain>
  Options Indexes FollowSymLinks MultiViews
  AllowOverride All
  Order allow,deny
  allow from all
</Directory>'
"""
read -p "Please press [Enter] for defaults or type domain name without www or http.. " x
if [[ $x != '' ]]
then
  sed -i '11i\	<Directory /var/www/html>' /etc/apache2/sites-available/000-default*
  sed -i '12i\		Options Indexes FollowSymLinks MultiViews' /etc/apache2/sites-available/000-default*
  sed -i '13i\		AllowOverride All' /etc/apache2/sites-available/000-default*
  sed -i '14i\		Order allow,deny' /etc/apache2/sites-available/000-default*
  sed -i '15i\		allow from all' /etc/apache2/sites-available/000-default*
  sed -i '16i\	</Directory>' /etc/apache2/sites-available/000-default*
else
  sed -i '11i\	<Directory /var/www/html>' /etc/apache2/sites-available/${x}
  sed -i '12i\		Options Indexes FollowSymLinks MultiViews' /etc/apache2/sites-available/${x}
  sed -i '13i\		AllowOverride All' /etc/apache2/sites-available/${x}
  sed -i '14i\		Order allow,deny' /etc/apache2/sites-available/${x}
  sed -i '15i\		allow from all' /etc/apache2/sites-available/${x}
  sed -i '16i\	</Directory>' /etc/apache2/sites-available/${x}
fi
clear
printf """

"""
read -p "Please press [Enter] to add pre-configured .htaccess to to /var/www/html and to test out if it works by adding phpinfo() function to index.html file" x
if [[ $x != '' ]]
  sudo rm /var/www/html/index.html && sudo touch /var/www/html/index.html
  sudo echo -e "<?php\\nphpinfo();\\n?>" > /var/www/html/index.html
  sudo echo -e "RewriteEngine On\\nAddType application/x-httpd-php .html" > /var/www/html/.htaccess
  sudo /etc/init.d/apache2 restart
fi
