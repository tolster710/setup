#Mounting of the Drobo
sudo echo -e "//192.168.2.45/Media /home/tolly/Drobo	cifs	username=Admin,password=Pass@word1,uid=tolly,gid=tusers,dir_mode=0774,file_mode=0774	0	0" >> /etc/fstab
sudo echo -e "#Above is the primary mount for Drobo and the default credentials    ">> /etc/fstab
sudo mount -a

#Installing software
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y xbmc sysstat iotop ssh gparted curl


#Adding xbmc config
#modify eventually so the user can enter the username, or take it from somewhere else
#also create a WAN advanced settings
cp advancedsettings.xml ~/home/tolly/.xbmc/userdata/


#droidmote installation

sudo chmod 777 droidmote
sudo echo -e "./home/tolly/Documents/droidmote/droidmote 2302 password &" >> /etc/rc.local

