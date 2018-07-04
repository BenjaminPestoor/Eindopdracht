#=============================
# Primary System updates
#=============================
sudo apt-get update
sudo apt-get upgrade

#===================================
# Installing Salt-Master (+minion)
#===================================
#curl -L https://bootstrap.saltstack.com -o install_salt.sh
#sudo sh install_salt.sh -M

#sleep 1
#service salt-master restart
#sleep 1

# Accept keys
#salt-key -A


#==========================================
# Installing Monitor Service (cacti)
#==========================================
# Create necessary directories
mkdir -p /usr/share/cacti/site/plugins/

# Install Prerequisites 
apt-get -y install php*
apt-get -y install php-*
apt-get -y install apache2
apt-get -y install snmp
apt-get -y install snmpd
apt-get -y install snmp-mibs-downloader
apt-get -y install rrdtool
apt-get -y install mysql-server
apt-get -y install unzip
apt-get -y phpmyadmin
echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf


# Creating a database for cacti
mysql --user="root" --password="admin" -e "CREATE DATABASE cacti"


# Configuring MYSQL config file
#nano /etc/mysql/mysql.conf.d/mysqld.cnf
# Add the following lines to the end of file:
#max_heap_table_size		= 98M
#tmp_table_size			= 64M
#join_buffer_size		= 64M
#innodb_buffer_pool_size	= 485M
#innodb_doublewrite		= off
#innodb_flush_log_at_timeout	= 3
#innodb_read_io_threads	= 32
#innodb_write_io_threads	= 16

service mysql restart
service apache2 restart

# install cacti 1.1.18
cd /home/andres
wget https://www.cacti.net/downloads/cacti-1.1.18.tar.gz
tar -xvzf cacti-1.1.18.tar.gz
mv cacti-1.1.18 cacti
mv cacti /var/www/html/

service snmpd restart
service mysql restart
service apache2 restart
sleep 2
#===================================
# Configure Central logservice
#===================================
cd /usr/share/cacti/site/plugins/

wget https://docs.cacti.net/_media/plugin:syslog-v1.22-2.tgz
mv plugin:syslog-v1.22-2.tgz syslog.tgz
tar -xvzf syslog.tgz

cd /usr/share/cacti/site/plugins/
wget https://docs.cacti.net/_media/plugin:settings-v0.71-1.tgz
mv plugin:settings-v0.71-1.tgz settings.tgz
tar -xvzf settings.tgz


cd /home/andres

# Log file locations:
#---------------------
# /var/log/salt/master
# /var/log/salt/minion



#=======================================
# Installing Docker
#=======================================
echo "==========================================="
echo "========= Installation Complete ==========="
echo "============ End of script ================"
