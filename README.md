# elementary Dropbox Mods
This script modifies Dropbox so that status icons will show in Wingpanel. It also optionally installs elementary themed Dropbox icons that better integrate with the system.

## Before Your Install
This script assumes that you have installed Dropbox from the [official website](https://dropbox.com/download), and have already launched the program at least once as well.

**Important:** Don't install Dropbox from the Software Center or via apt-get. The versions in the repository are extremely outdated and will not work with this script.

**Disclaimer:** Running this script could make your entire system explode. Use with caution and, as always, it's good practice to have a solid backup. :)

## Download

The project is hosted on [GitHub](https://github.com/moka-project/moka-icon-theme)

The easiest way to download it is by clicking the 'Download ZIP' button there.

Alternatively, you can clone the latest version its git repository:

    git clone https://github.com/nathandyer/elementary-dropbox-mods


## Installation

Extract the contents of the .zip file to a folder. From inside the folder, right-click and choose "Open In... > Terminal"

Once the terminal window opens, you can either type:

    ./dropbox-elementary.sh

to simply fix Dropbox so that the icons will display, or:

    sudo ./dropbox-elementary.sh

which will give you the extra option of installing the elementary themed icons as well

## After installation

The changes should take affect immediately. If you weren't given any error messages, try restarting your system first before notifying me of the issue. If a problem does persist, please let me know [here](https://github.com/nathandyer/elementary-dropbox-mods/issues).

## Credits

The icons were created by Mr. Magical and are GPL licensed. You can find the [originals here](http://gnome-look.org/content/show.php/Dropbox+for+Elementary+%235?content=134298).

