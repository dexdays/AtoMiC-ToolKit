#!/bin/bash
# Script Name: AtoMiC SickRage Uninstaller
# Author: htpcBeginner
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

if [[ $1 != *"setup.sh"* ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi

source $2/inc/commons.sh
source $SCRIPTPATH/inc/header.sh

echo -e $GREEN'AtoMiC SickRage Uninstaller Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

echo -e $YELLOW'--->Stopping SickRage...'$ENDCOLOR
sudo /etc/init.d/sickrage stop >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Removing SickRage Autostart scripts...'$ENDCOLOR
sudo update-rc.d -f sickrage remove || { echo -e $RED'Warning! update-rc.d remove failed.'$ENDCOLOR ; }
sudo rm /etc/default/sickrage || { echo -e $RED'Warning! Removing default script failed.'$ENDCOLOR ; }
sudo rm /etc/init.d/sickrage || { echo -e $RED'Warning! Removing init script failed.'$ENDCOLOR ; }

echo
sleep 1

echo -e $GREEN'Do you want to keep SickRage installation files as a backup or for reinstalling later?'$GREEN
read -p 'Type y/Y to keep files or any other key to delete files, and press [ENTER] : '
FILEDEL=${REPLY,,}

if [ "$FILEDEL" != "y" ] 
then
	echo
	echo -e $YELLOW'--->Deleting SickRage files from '$CYAN'/home/'$UNAME'/.sickrage'$YELLOW'...'$ENDCOLOR
	sudo rm -r /home/$UNAME/.sickrage
else
	echo
	echo -e $YELLOW'--->Keeping SickRage files in '$CYAN'/home/'$UNAME'/.sickrage'$YELLOW'...'$ENDCOLOR
fi

echo
sleep 1

echo -e $GREEN'--->All done.'$ENDCOLOR
echo -e 'SickRage Uninstalled.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh