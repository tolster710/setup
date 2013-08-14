sudo apt-get update
sudo apt-get install -y cifs-utils


#Mounting of the Drobo

while true; do
	read -p "Do you want to create a Drobo mount?" yn
	case $yn in
	[Yy]* ) 

	sudo echo -e "//192.168.2.45/Media /home/tolly/Drobo	cifs	username=Admin,password=Pass@word1,uid=tolly,gid=tolly,dir_mode=0774,file_mode=0774	0	0" >> /etc/fstab;
sudo echo -e "#Above is the primary mount for Drobo and the default credentials    ">> /etc/fstab;
mkdir /home/tolly/Drobo;
sudo mount -a;
break;;
[Nn]* ) break;;
	* ) echo "Please answer yes or no/";;
	esac
done

echo "---------------------------------"


#Installing software
sudo apt-get update
#sudo apt-get upgrade -y


sudo apt-get install -y xbmc sysstat iotop ssh gparted curl python g++ make apt-show-versions;


#Adding xbmc config
#modify eventually so the user can enter the username, or take it from somewhere else
#also create a WAN advanced settings
while true; do
	read -p "Do you want to configure xbmc - if so then launch it and hit y" yn
	case $yn in
	[Yy]* ) 


cp advancedsettings.xml /home/tolly/.xbmc/userdata/;
break;;
	[Nn]* ) break;;
	* ) echo "Please answer yes or no/";;
	esac
done


#Adding Aliases
alias lss="ls -hal"
alias bk="cd .."
# Installing webmin on sever

while true; do
	read -p "Do you wish to install Webmin? (yes for tolly DC)" yn
	case $yn in
	[Yy]* ) 

		wget http://www.webmin.com/download/deb/webmin-current.deb;
		sudo apt-get install libauthen-pam-perl libnet-ssleay-perl;
		dpkg --install webmin-current.deb;
		#remove files

		rm webmin-current.deb;
		break;;
	[Nn]* ) break;;
	* ) echo "Please answer yes or no/";;
	esac
done




#droidmote installation
while true; do
	read -p "Do you want to install droidmote and add to startup?" yn
	case $yn in
	[Yy]* ) 

mkdir /home/tolly/Documents/droidmote;
cp  /home/tolly/Drobo/Data/Apartment_data/linux\ 64bit/* /home/tolly/Documents/droidmote/;
cd /home/tolly/Documents/droidmote/;
chown -R tolly /home/tolly/Documents/droidmote/;
sudo chmod 777 droidmote;
sudo echo -e "./home/tolly/Documents/droidmote/droidmote 2302 password &" >> /etc/rc.local;
break;;

[Nn]* ) break;;
	* ) echo "Please answer yes or no/";;
	esac
done

echo "Droidmote installed and added to startup"
echo "Done! - quitting"

