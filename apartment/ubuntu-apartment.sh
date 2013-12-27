

	#Prompt to install core packages and dependencies - such as python, screen, ssh, sysstat - and other userful utilities
	while true; do
		read -p "Install python, make, screen, and ssh? (Typically yes in any environment)" yn
		case $yn in
		[Yy]* ) 
			sudo apt-get update;
			sudo apt-get install -y git-core sshfs openssl screen python-software-properties python g++ make apt-show-versions cifs-utils;
			break;;
		[Nn]* ) break;;
		* ) echo "Please answer yes or no/";;
		esac
	done


#Mounting of the Drobo

while true; do
	read -p "Do you want to create a Drobo mount?" yn
	case $yn in
	[Yy]* ) 

	sudo echo -e "//192.168.2.45/Media /home/tolly/Drobo	cifs	username=Admin,password=Pass@word1,uid=tolly,gid=tolly,dir_mode=0774,file_mode=0774	0	0" | sudo tee -a /etc/fstab;
	sudo echo -e "#Above is the primary mount for Drobo and the default credentials    ">> /etc/fstab;
	mkdir /home/tolly/Drobo;
	sudo mount -a;
	break;;
[Nn]* ) break;;
	* ) echo "Please answer yes or no/";;
	esac
done

echo "---------------------------------"



	echo "-------------------------------------"
	echo "Done...."
	echo "---------------------------------------------"	
	echo "--------------------------------------"
	#Prompt to install updates using apt-get update
	while true; do
		read -p "Install all updates?" yn
		case $yn in
		[Yy]* ) 
			sudo apt-get update;
			sudo apt-get upgrade -y;
			break;;
		[Nn]* ) break;;
		* ) echo "Please answer yes or no/";;
		esac
	done
	echo "Done...."
	echo "---------------------------------------------"	
	echo "-------------------------------------"

while true; do
		read -p "Install xbmc, apache server, and system tools? " yn
		case $yn in
		[Yy]* ) 
			sudo apt-get install -y xbmc sysstat iotop ssh gparted curl python g++ make apt-show-versions apache2 bmon sysstat;
			break;;
		[Nn]* ) break;;
		* ) echo "Please answer yes or no/";;
		esac
	done

while true; do
		read -p "Install scipy, pandas, and python inotebook? " yn
		case $yn in
		[Yy]* ) 
			sudo apt-get install -y python-pandas python-scipy ipython-notebook;
			break;;
		[Nn]* ) break;;
		* ) echo "Please answer yes or no/";;
		esac
	done

while true; do
		read -p "configure ipython-notebook server? " yn
		case $yn in
		[Yy]* ) 
			ipython profile create nbserver;
			sudo echo 'c.NotebookApp.ip="*"' >> ~/.config/ipython/profile_nbserver/ipython_notebook_config.py;
			sudo echo 'c.NotebookApp.open_browser=False' >> ~/.config/ipython/profile_nbserver/ipython_notebook_config.py;
			break;;
		[Nn]* ) break;;
		* ) echo "Please answer yes or no/";;
		esac
	done

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
alias gits="git status"
alias gitc="git commit -m"
alias gita="git add *"
alias gitpom="git push origin master"

# Installing webmin on sever

while true; do
	read -p "Do you wish to install Webmin? " yn
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

mkdir /home/tolly/Documents/utilities/droidmote;
cp  /home/tolly/Drobo/Data/Apartment_data/linux\ 64bit/* /home/tolly/Documents/utilities/droidmote/;
cd /home/tolly/Documents/utilities/droidmote/;
chown -R tolly /home/tolly/Documents/utilities/droidmote/;
sudo chmod 777 droidmote;
sudo echo -e "./home/tolly/Documents/utilities/droidmote/droidmote 2302 password &" >> /etc/rc.local;
break;;

[Nn]* ) break;;
	* ) echo "Please answer yes or no/";;
	esac
done

echo "Droidmote installed and added to startup"


while true; do
	read -p "Do you want to Install teamviewer?  :  " yn
	case $yn in
	[Yy]* ) 
	#while true; do
		#read -p "32 bit or 64 bit?  "
	wget  http://download.teamviewer.com/download/teamviewer_linux_x64.deb
	dpkg -i teamviewer_linux_x64.deb
	rm teamviewer_linux_x64.deb

[Nn]* ) break;;
	* ) echo "Please answer yes or no/";;
	esac
done

echo "Done! - quitting"

# teamviewer 64 bit deb url : http://download.teamviewer.com/download/teamviewer_linux_x64.deb
# 32 bit url http://download.teamviewer.com/download/teamviewer_linux.deb

