#For odoo7,8 and 9 in ubuntu 14.04 and above
apt-get -y install  python-lxml python-mako python-egenix-mxdatetime python-dateutil python-psycopg2 python-pychart python-pydot python-tz python-reportlab python-yaml python-vobject python python-dev python-setuptools build-essential python-CherryPy3 python-pybabel python-formencode python-simplejson python-pyparsing python-gtk2 python-glade2 python-matplotlib python-egenix-mxdatetime python-tz python-hippocanvas python-pydot python-werkzeug python-openid python-webdav python-libxml2 python-lxml python-libxslt1 python-unittest2 python-docutils python-mock python-jinja2 python-software-properties python-decorator python-psutil python-requests python-pyPdf python-passlib python-xlwt python-xlrd python-gdata python-pip python-html2text vim node-less openssh-server openjdk-7-jdk  apache2 php5 libapache2-mod-php5 php5-mcrypt git postgresql-9.3

# For openjdk-8-jdk in 14.04 (from 14.10 it is default)
add-apt-repository ppa:openjdk-r/ppa
apt-get update 
apt-get install openjdk-8-jdk
update-alternatives --config java

#For ubuntu 12.04 odoo9
apt-get remove --purge node-less nodejs
apt-get install python-software-properties software-properties-common
apt-add-repository ppa:chris-lea/node.js
apt-get update
apt-get install nodejs
npm install -g less
npm install -g less-plugin-clean-css
#if /usr/bin/lessc error comes
 npm install -g less
 #or
 apt-get install -y npm
 ln -s /usr/bin/nodejs /usr/bin/node
 npm install -g less
#python-lesscpy is also needed 
wget -c https://pypi.python.org/packages/source/l/lesscpy/lesscpy-0.10.2.tar.gz#md5=fedbad1f4eb19c3af37f09560156246d
#extract and run 
python setup.py install

#add .gitconfig
git config --global user.name <name>
git config --global user.email <email>

pip install num2words

#64-bit wkhtmltopdf
wget -c https://downloads.wkhtmltopdf.org/0.12/0.12.1/wkhtmltox-0.12.1_linux-trusty-amd64.deb
dpkg -i wkhtmltox-0.12.1_linux-trusty-amd64.deb

#32-bit wkhtmltopdf
wget -c download.gna.org/wkhtmltopdf/0.12/0.12.1/wkhtmltox-0.12.1_linux-trusty-i386.deb
dpkg -i wkhtmltox-0.12.1_linux-trusty-i386.deb

ln -s /usr/local/bin/wkhtmltopdf /usr/bin/wkhtmltopdf


apt-get install mysql-server php5-mysql

apt-get install phpmyadmin -y

apt-get install phppgadmin -y
cp /etc/apache2/conf.d/phppgadmin /etc/apache2/conf-available/phppgadmin.conf
a2enconf phppgadmin
service apache2 restart

#install skype -: enable canonical partners in sw&updates -> other sw -> canonical partner.skype for linux is 32 bit.
apt-get install skype

#perl warning about Language
locale-gen en_US en_US.UTF-8
dpkg-reconfigure locales 
export LC_ALL="en_US.UTF-8"
echo 'LANGUAGE="en_US.UTF-8"' >> /etc/default/locale
echo 'LC_ALL="en_US.UTF-8"' >> /etc/default/locale
#

#ubuntu make installation
add-apt-repository ppa:ubuntu-desktop/ubuntu-make
apt-get update
apt-get install ubuntu-make
#How to install android-studio
umake android

#Postgres installation and configuration
# postgres 9.4 is available in 15.10
# to confirm that
apt-cache search postgres
# verify there is a postgres 9.4 entry
#in ubuntu < 15.04
#Create the file 
vim /etc/apt/sources.list.d/pgdg.list
#and add a line for the repository
deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main #12.04
deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main #14.04
deb http://apt.postgresql.org/pub/repos/apt/ utopic-pgdg main #14.10
deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main #16.04
#Import the repository signing key, and update the package lists
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
apt-key add -
apt-get update
apt-get install postgresql-9.4
#add user to postgres
su - postgres
createuser <username> -d -P

          OR       
	{
  	createuser <username> -P
	#give password
	#give user to create db permission
	psql
	alter user <username> with createdb;
	\q
	#Incase no password given
	psql
	alter role <user> with password '<password>';
	}

# No PostgreSQL clusters exist; see "man pg_createcluster"
dpkg-reconfigure locales
pg_createcluster 9.4 main --start

#all db size
su postgres
psql
SELECT pg_database.datname,pg_size_pretty(pg_database_size(pg_database.datname)) AS size FROM pg_database;

# a specific db size
SELECT pg_size_pretty(pg_database_size('<db_name>'));

# Rename db,owner and postgres
# if 'name' or 'new_name' comtails CAPS letters mustbe in ''
su postgres
psql
ALTER DATABASE name RENAME TO new_name; 
ALTER DATABASE name OWNER TO new_owner;
ALTER USER name RENAME TO new_name;
#List all postgrs user
select * from pg_user;

#Change Tables,view and Sequence user
#Tables:
for tbl in `psql -qAt -c "select tablename from pg_tables where schemaname = 'public';" YOUR_DB` ; do  psql -c "alter table \"$tbl\" owner to NEW_OWNER" YOUR_DB ; done

#Sequences:
for tbl in `psql -qAt -c "select sequence_name from information_schema.sequences where sequence_schema = 'public';" YOUR_DB` ; do  psql -c "alter table \"$tbl\" owner to NEW_OWNER" YOUR_DB ; done

#Views:
for tbl in `psql -qAt -c "select table_name from information_schema.views where table_schema = 'public';" YOUR_DB` ; do  psql -c "alter table \"$tbl\" owner to NEW_OWNER" YOUR_DB ; done

# open in terminal
apt-get install nautilus-open-terminal
nautilus -q  

# Running boot script at startup
update-rc.d <odoo-server> defaults

# ssh port forward
# ssh -f -N -R <remoteport8455>:localhost:<localport8069> root@<ip>
# ssh tunnel through another machine
ssh -t user@host1 ssh user@host2

#gdfb amazon module
wget -c 77.243.229.249/python-amazon-mws-master.zip
unzip python-amazon-mws-master.zip
cd python-amazon-mws-master/
python setup.py install
pip install pycountry
apt-get install python-mysqldb

#run python import script for import from csv file
python <importfile> localhost <dbname> <user> <password> <csvfile>

#find mem % used by process
ps -A --sort -rss -o pid,comm,pmem, | head -n 20
ps -A --sort -rss -o pid,comm,pmem, | head -n 20 | grep postgres
#manage swappines
cat /proc/sys/vm/swappiness
#/etc/sysctl.conf -->> vm.swappiness = 10 or
sysctl vm.swappiness=10

#notify-send
apt-get install notify-osd
#database manager link
#<link>/web/database/manager

#sound chk
alsamixer # headphone and front mic should be 00. If mm press 'm' to change to 00
#at sound settings chk allow morethan 100%

# find with max-depth
find . -maxdepth 1 -mtime -1 -type f
#ignore all .sql file
find -maxdepth 1 ! -iname "*.sql*" -mtime +30
# or ('i' in  iname is for case sensitive )
find -maxdepth 1 -not -iname "*.sql*" -mtime +30

#Open Remote Display on ssh
export DISPLAY=:0
ssh -X 192.168.1.40 -v "gnome-terminal" # get the remote terminal in 

#terminal color
alias ls='ls --color=auto'
or 
vim .bashrc
< turn on force_color_prompt=yes >
log out and login 
vim .bashrc
<turn off force_color_prompt=yes >

#if no bashrc file 
cp -r /etc/skel/.bashrc .
source .bashrc

#touch
touch -t 1008211020 temp
touch -d "2days 10 hours 30  mins ago" temp
find . -newer temp

# find and delete using xargs
find . -type f -print0| xargs -0 sed -i '/<start text>/,/<end text>/d'

# Fonts
cp <font> /usr/share/font # or .font folder at home
fc-cache -f -v  # update cache
fc-match <font> # check font activated

sudo apt-get install ttf-mscorefonts-installer
sudo fc-cache
fc-match Arial # font name
#optional
sudo apt-get install --reinstall ttf-mscorefonts-installer

#Times new roman barcode print error
#This error is also post in bugs.debian.org, and patch is provide to avoid this error.
#And another solution is :
#Download this pfbfer.zip, and extract it.
wget www.reportlab.com/ftp/fonts/pfbfer.zip
#Now put all the files of this pfbfer in...
cd /usr/lib/python2.7/dist-packages/reportlab/fonts/(put the files)
#If the fonts folder is not available in reportlab directory then create it and put all the font-files in fonts from the extract folder pfbfer.



# View contents in a zip file
less <file.zip>
unzip -l <file.zip>
less <file.zip> | awk {'print $8'} | cut -d '/' -f1 | uniq -d   # waring : looks -f1 in cut

#for tar file
tar -tf <filename.tar.gz>
tar -tf <filename.tar.gz> | cut -d '/' -f1 | uniq -d # waring : looks -f1 in cut

# csv ';' seperator spec
# sep=; in file field (the heading)

# kiak gw add
route add default gw 212.76.76.9 eth1

#fork bomb

:(){ :|:& };:

# prevent fork bomb
#edit
vi /etc/security/limits.conf
       *    hard   nproc nnn
eg : vivek  hard   nproc 300

# open terminal from terminal and execute cmd on it
gnome-terminal -x sh -c "<cmd>"
eg : gnome-terminal -x sh -c "sleep 1 ; df -h ;sleep 5 ;"

# To remove all pkg of a specific pgm
     for a in `dpkg -l | grep <pkg_name> | awk -F" " '{print $2}'` ;do dpkg --purge $a;done
eg : for a in `dpkg -l | grep openoffice | awk -F" " '{print $2}'` ;do dpkg --purge $a;done

#Free remote desktop connection
xfreerdp -u "<user_name>" -p "<passwd>" -f <ip/hostename>
eg : xfreerdp -u "odoo" -p "odoo@jsrbh1" -f 188.116.192.225

#know Ubuntu support status
ubuntu-support-status 

#add ftp user
useradd --home </var/www/htm/ pathto folder> --shell /bin/false <new_username>
passwd <new_username>
chown <new_username>:www-data <new_username>/ -R

# oldrelease update
mv /etc/apt/sources.list /etc/apt/sources.list.backup
sed -i -re 's/([a-z]{2}\.)?archive.ubuntu.com|security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list
apt-get update (&& apt-get dist-upgrade)

#disable write protection
hdparm -r0 /dev/sdb

# Install ubuntu in windows machine but not able to login in to ubuntu only get windows, again login into live usb then 
# open terminal
sudo add-apt-repository ppa:yannubuntu/boot-repair
sudo apt-get update
sudo apt-get install -y boot-repair && boot-repair

#if no sucess after above setup Login into windows , open cmd as admin, run following cmd
bcdedit /set "{bootmgr}" path \EFI\ubuntu\grubx64.efi

#bipd vpn
sudo openvpn --config client.ovpn

number@nma.vodafone.in

# if file not deleted even as root check secondary attribute
lsattr filename
#change attribute using
chattr -/+/= {aASijtdu} filename
eg: chattr +i filename
    chattr -i filename
    chattr -R +i directory
    chattr -R -i directory
# persist resolve.conf
vim /etc/resolvconf/resolv.conf.d/base. 
nameserver 8.8.8.8
resolvconf -u

# Compile python file
python -m pycompile file1.py file2.py ..

#Change crontab editor
select-editor

# Pic stick to cursor
gsettings set org.gnome.settings-daemon.plugins.cursor active true

#find who logged in
last -a
last reboot
last shutdown

#create sha512 passwd
mkpasswd --method=sha-512

# How to unistall pkg installed via setup.py cmd
python setup.py install --record files.txt
cat files.txt | xargs rm -rf

#Update Kernal
apt-get update && apt-get install linux-image-generic
or
apt-get update && apt-get install linux-generic # install header for building kernal modules

#WARNING: Security updates for your current Hardware Enablement Stack
#ended on 2016-08-04:
# * http://wiki.ubuntu.com/1404_HWE_EOL

hwe-support-status --show-replacements # if hwe-support-status not available install 'apt install update-manager-core'
# install those pks from the above cmd
#following are for ubuntu 14.04
apt-get install linux-image-generic-lts-xenial linux-generic-lts-xenial
or 
apt-get install --install-recommends linux-generic-lts-xenial
or
apt-get install --install-recommends linux-generic-lts-xenial xserver-xorg-core-lts-xenial xserver-xorg-lts-xenial xserver-xorg-video-all-lts-xenial xserver-xorg-input-all-lts-xenial libwayland-egl1-mesa-lts-xenial # for graphical

#Mail queue

#Display mail queue
mailq 
mailq > mailqueue.txt
postqueue -p  
postqueue -p > mailqueue.txt

#View message (contents, header and body) in Postfix queue
#To view a message with the ID XXXXXXX
#(you can see the ID from the queue)
postcat -vq XXXXXXXXXX
postcat -vq <ID>

#delete mailques 
postsuper -d <ID>
postsuper -d ALL

