#!/bin/bash
clear
osascript -e 'tell application "Terminal"' -e "set position of window 1 to {400, 36}" -e "tell front window" -e "set the number of rows to 48" -e "set the number of columns to 80" -e "end tell" -e "end tell"
echo "Welcome to Homer!"
echo
echo
echo "This script will install the following programs into the specified locations:" 
echo
echo "* Homer, command-line script and GUI app for renaming, rotating and binding scanned pages:
------> /usr/local/bin/homer
------> /Applications/Homer/Homer.app"
echo  
echo "* Scan Tailor, interactive post-processing tool for scanned pages:
------> /Applications/ScanTailor.app"
echo
echo "* Homebrew, the missing package manager for OS X: 
------> /usr/local/bin/brew
------> /usr/local/Library/Formula/...
------> /usr/local/Library/Homebrew/..."
echo
echo "* ImageMagick, open source software suite for manipulating images, with its dependencies: 
------> /usr/local/Cellar/imagemagick/6.7.1-1/...
------> /usr/local/Cellar/jpeg/8c/...
------> /usr/local/Cellar/jasper/1.900.1/...
------> /usr/local/Cellar/little-cms/1.19/...
------> /usr/local/Cellar/libtiff/3.9.5/..."
echo
echo "* JBIG2 encoder, compression tool for bi-level images:
------> /usr/local/Cellar/jbig2enc/0.27-17b36fa/..."
echo
echo "* Tesseract-ORC, free open source OCR engine sponsored by Google, with Leptonica library for enhanced image processing: 
------> /usr/local/Cellar/tesseract/3.00/...
------> /usr/local/Cellar/leptonica/1.68/..."
echo
echo "* Brewbygems, making RubyGems and Homebrew play nice together:
------> /usr/local/Cellar/gems/1.8/gems/brewbygems-0.4.0/..."
echo
echo "* Hpricot, HTML parser:
------> /usr/local/Cellar/gems/1.8/gems/hpricot-0.8.4/..."
echo
echo "* RMagick, interface between the Ruby programming language and ImageMagick:	
------> /usr/local/Cellar/gems/1.8/gems/rmagick-2.13.1/..."
echo
echo "* pdfbeads, Ruby utility to create searchable PDF:
------> /usr/local/Cellar/gems/1.8/bin/pdfbeads
------> /usr/local/Cellar/gems/1.8/gems/pdfbeads-1.0.3/..."
echo
read -n 1 -p "The script requires administrative privileges to run. Press Enter to continue..."

if [ "$REPLY" == "" ]; then
	if [ ! "$(which brew)" == "" ]; then
		echo
		echo "It appears that you have another copy of Homebrew installed at \"`brew --prefix`\"."
		echo "Please uninstall or use the manual installation for Homer instead." 
		echo "For help, please visit http://bookscanner.pbworks.com/."
		echo
		exit 1
	else
		# determining the path to the script’s parent folder
		MY_PATH="`dirname \"$0\"`"     
		MY_PATH="`( cd \"$MY_PATH\" && pwd )`"
		if [ -z "$MY_PATH" ] ; then
		  exit 1
		fi
		
		# running Homebrew installation script
		ruby "$MY_PATH/Resources/homebrew.rb"
		
		# checking if Homebrew installed correctly
		if [ ! "$(which brew)" == "" ]; then
			echo
		
		# installing the pre-compiled binaries to Homebrew's "Cellar" folder
			echo "Extracting pre-compiled binaries to /usr/local/Cellar..."
			tar xz -mf "$MY_PATH/Resources/Cellar.tar.gz" -C /usr/local
			echo
			echo "Creating symlinks in /usr/local folder:"
			echo
			brew link imagemagick jasper jbig2enc jpeg leptonica libtiff little-cms tesseract
			echo
		
		# Installing "brewbygems" (http://github.com/indirect/brewbygems)
			GEM_HOME='/usr/local/Cellar/gems/1.8'
			echo "GEM_HOME='/usr/local/Cellar/gems/1.8'"
			if [ -f ~/.bash_profile ]; then
				bashprof=`cat ~/.bash_profile`
				if [[ ! $bashprof =~ .*.bashrc.* ]]; then
					echo 'Appending "source ~/.bashrc" to ~/.bash_profile'
					echo "if [ -f ~/.bashrc ]; then
					source ~/.bashrc
					fi" >> ~/.bash_profile
				fi
			else
				echo 'Appending "source ~/.bashrc" to ~/.bash_profile'
				echo "if [ -f ~/.bashrc ]; then
				source ~/.bashrc
				fi" >> ~/.bash_profile
			fi
			if [ -f ~/.bashrc ]; then
				bashrc=`cat ~/.bashrc`
				if [[ ! $bashrc =~ .*GEM_HOME\=\'\/usr\/local\/Cellar\/gems\/1.8\'.* ]]; then
					echo 'Appending "$GEM_HOME" path to ~/.bashrc'
					echo "export GEM_HOME='/usr/local/Cellar/gems/1.8'" >> ~/.bashrc
					source ~/.bashrc
				else
					echo '"$GEM_HOME" path is already in ~/.bashrc'
				fi
			else
				echo 'Appending "$GEM_HOME" path to ~/.bashrc'
				echo "export GEM_HOME='/usr/local/Cellar/gems/1.8'" >> ~/.bashrc
				source ~/.bashrc	
			fi
			echo
			echo 'Installing "brewbygems" ruby gem:' 
			echo
			cd "$GEM_HOME"
			gem install "$MY_PATH/Resources/brewbygems-0.4.0.gem"
			echo
		
		# Installing "pdfbeads" ruby gem
			echo 'Installing "pdfbeads" ruby gem:'
			echo
			gem install "$MY_PATH/Resources/pdfbeads-1.0.3.gem"
			echo 
		
		# Installing Homer script and application
			echo 'Installing "homer" bash script to /usr/local/bin...'
			tar xz -mf "$MY_PATH/Resources/homer.sh-1.0b1.tar.gz" -C /usr/local/bin
			echo
			echo 'Installing "Homer.app" to /Applications folder...'
			tar xz -mf "$MY_PATH/Resources/Homer.app-v1.0b1.tar.gz" -C /Applications
			cp "$MY_PATH/Resources/uninstall.command" /Applications/Homer/uninstall-homer.command
		
		# Adding "Homer.app" to the Dock
			echo 'Adding "Homer.app" to the Dock...'
			defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Homer/Homer.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
		
		# Installing "ScanTailor.app"
			echo
			echo 'Installing "ScanTailor.app" to /Applications folder…'
			tar xz -mf "$MY_PATH/Resources/ScanTailor1.0.0beta11.tar.gz" -C /Applications
		
		# Adding "ScanTailor.app" to the Dock
			echo 'Adding "ScanTailor.app" to the Dock...'
			defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/ScanTailor.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
			osascript -e 'tell application "Dock" to quit'
		
		# Creating an alias on the Desktop (default disabled)
		#osascript -e 'tell application "Finder" to make new alias file at desktop to POSIX file "/Applications/Homer/Homer.app"'
		#osascript -e 'tell application "Finder" to make new alias file at desktop to POSIX file "/Applications/ScanTailor.app"'
		
		# Checking that the installation was successful
			a=0
			while read f; do 
			  if [ ! -f "$f" ]; then
				echo "* Error: $f was not installed!" >> "/Users/$USER/Desktop/homer-installation-log.txt"
				let a=a+1
				fi
			done < "$MY_PATH/Resources/installation-script.txt"
			if a=0; then
				echo
				echo "Homer: Installation successful!"
				echo
			else
				echo
				echo 'Homer: Installation unsuccessful. See "homer-installation-log.txt" file on the Desktop'
				echo
			fi
		fi
	fi
fi

