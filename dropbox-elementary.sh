#!/bin/bash
# Authors:
#   Nathan Dyer <mail@nathandyer.me>
#
# Featuring the icons created by Mr. Magical, also licensed under the GPL.
# You can find the originals at:
#	http://gnome-look.org/content/show.php/Dropbox+for+Elementary+%235?content=134298
#
# This script free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation; version 3.
#
# This file is part of the Moka Icon Theme and is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, see <https://www.gnu.org/licenses/gpl-3.0.txt>

function icons {
ls
if [ -d icons ]; then
	echo "Copying icons..."
	cp -rT icons /usr/share/icons/elementary/
	echo "Updating the icon cache"
	gtk-update-icon-cache /usr/share/icons/elementary
else
	echo "Error installing icons: icons directory missing"
fi
}

clear
echo '#-----------------------------------------#'
echo '#     elementary Dropbox Modifications    #'
echo '#-----------------------------------------#'

# Check for admin rights
if [ "$(id -u)" = "0" ]; then
	echo "This script is running as root."
else
	echo "This script does not have root privileges."
	read -p "You will not be able to install the custom icons. Continue? (Y)es, (N)o : " INPUT
	case $INPUT in
		[Yy]* );;
		[Nn]* ) exit 0;;
	    * )
	    clear && echo 'Sorry, try again.'
	    main
	    ;;
	esac

fi

# Check to make sure the Dropbox dist folder exists
if [ -d ~/.dropbox-dist ]; then
	CURRENT=$PWD
	cd ~/.dropbox-dist
	echo "Backing up original dropboxd file..."
	cp dropboxd dropboxd.bak
	echo "Modifying dropboxd file..."
	awk 'NR==2{print "XDG_CURRENT_DESKTOP=Unity"}7' dropboxd > temp
	echo "XDG_CURRENT_DESKTOP=Pantheon" >> temp
	cp temp dropboxd
	rm temp
	cd $CURRENT
else
	echo "This script requires that Dropbox be installed. Download from"
	echo "https://dropbox.com/download and retry this script."
	exit 1
fi

# Install the custom icons
if [ "$(id -u)" = "0" ]; then
	read -p "Would you like the install the custom icons? (Y)es, (N)o : " INPUT
	case $INPUT in
		[Yy]* ) icons;;
		[Nn]* );;
	    * )
	    clear && echo 'Sorry, try again.'
	    main
	    ;;
	esac
fi

# Restart dropbox
echo "Restarting dropbox..."
dropbox stop
dropbox start

echo "elementary Dropbox modifications complete."

exit 0
