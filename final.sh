#=============================
# Primary System updates
#=============================
sudo apt-get update
sudo apt-get upgrade

#=============================
# ...
#=============================


#=======================================
# Installing Salt-Master
#=======================================
curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh -M

# Config file:

#==========================================
# Installing prerequired software (Manual)
#==========================================
apt-get -y install php
apt-get -y install apache2
apt-get -y install php-mysql
apt-get -y install php-snmp
apt-get -y install php-xml
apt-get -y install snmp
apt-get -y install snmpd
apt-get -y install snmp-mibs-downloader
apt-get -y install rrdtool
apt-get -y install mysql-server




#=======================================
# Installing Docker
#=======================================


