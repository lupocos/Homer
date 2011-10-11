#!/bin/bash
clear
echo
read -n 1 -p 'Are you sure you want to uninstall Homer and all the supporting software? Press ENTER to confirm:'
if [ "$REPLY" == "" ]; then
	echo
	gem uninstall brewbygems rmagick hpricot 
	gem uninstall -x pdfbeads &> /dev/null
	[ ! -f "/usr/local/Cellar/gems/1.8/bin/pdfbeads" ] && echo "Successfully uninstalled pdfbeads-1.0.3"
	sed '/GEM_HOME/d' ~/.bashrc > ~/.bashrc
	source ~/.bashrc
	rm /usr/local/bin/homer
	[ ! -f "/usr/local/bin/homer" ] && echo "Successfully uninstalled homer bash script"
	rm -R /Applications/Homer
	appspre=`defaults read com.apple.dock persistent-apps`  
	nl=`echo "x" | tr 'x' '\34'` 	
	homerpost=`echo -n "$appspre" | sed "s/^[()]$//;s/},/}$nl/" | tr '\n\34' '\00\n'| grep -va "Homer" | tr '\n\00' ',\n' | sed 's/^,$//'`
	defaults write com.apple.dock persistent-apps "($homerpost)" &> /dev/null
	rm -R /Applications/ScanTailor.app
	appspre2=`defaults read com.apple.dock persistent-apps`  
	scantpost=`echo -n "$appspre2" | sed "s/^[()]$//;s/},/}$nl/" | tr '\n\34' '\00\n'| grep -va "ScanTailor" | tr '\n\00' ',\n' | sed 's/^,$//'`
	defaults write com.apple.dock persistent-apps "($scantpost)" &> /dev/null
	osascript -e 'tell application "Dock" to quit'
	[ ! -d "/Applications/Homer" ] && echo "Successfully uninstalled Homer.app"
	[ ! -d "/Applications/ScanTailor.app" ] && echo "Successfully uninstalled ScanTailor.app"
	cd /usr/local
	rm -rf Cellar
	brew prune &> /dev/null
	rm -rf Library .git .gitignore bin/brew README.md share/man/man1/brew share/man/man1/brew.1 share/man/man1/brew-man.1
	rm -rf ~/Library/Caches/Homebrew
	[ ! -f "/usr/local/bin/brew" ] && echo "Successfully uninstalled Homebrew"
	echo
	echo "Homer: uninstallation completed"
	echo
fi
