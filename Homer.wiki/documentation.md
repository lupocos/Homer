# Documentation #

## Homer bash script ## 

- download standalone script: [homer.sh][homer-standalone-download] 

The script loads a directory of images which is expected to contain 2n images, and applies to them a series of manipulations. If no arguments are entered, the script returns the "Usage" info: 

	Usage: homer /path/to/input/directory [-r, -R, -L, -l \"lang\"] [-o \"output\"]"

	Options:
	-r, --rename" 
    	rename the first half of the files with incremental odd numbers, the second"
    	half with incremental even numbers (JPEG only);"
	-R, --right" 
    	rename (as above) and rotate the right-hand pages 90 degrees clockwise, and"
    	the left-hand pages 90 degrees counterclockwise, starting from the RIGHT "
    	pages (JPEG only);"
	-L, --left" 
    	rename and rotate (as above) starting from the LEFT pages (JPEG only);"
	-l, --lang" 
    	run Tesseract OCR and convert the images into a searchable PDF (TIFF only),"
    	type \"homer -l\" (or \"--lang\") to view the list of supported languages;"
	-o, --output"
    	for [-r, -R, -L], the output is the path to the directory where the renamed"
       	    images should be saved (default is \$1/renamed);"
    	for [-l], the output is the path to the final PDF, or its filename (default" 
        	is \$PWD/out.pdf)."

If only the first argument (i.e., the input directory) is entered, the script prompts the user to select whether to rename & rotate, simply rename, or run OCR engine and converting to PDF.  

The options `-R`, `-L`, and `-r` allow to reorder a batch of JPEG images such that the first half and the second half are interspersed: that is, the first half is renamed with incremental odd numbers, while the second half is renamed with incremental even numbers.  

The options `-R` and `-L` allow to fix the orientation of the JPEG images, by rotating the pages on the right-hand side of book 90 degrees clockwise, and those on the left-hand side of the book 90 degrees counterclockwise.  

Finally, the option `-l` runs "Tesseract OCR" to extract the text from a batch of TIFF images, and then uses "PDFbeads" to bind the images and the text into a single, searchable PDF. The `-l` option must be followed by the three-character label for the desired Tesseract language. To print the list of supported languages with their correspondni glabels, you can type `homer -l` or `homer --lang`.

The `-o` option allows to specify the output location of the renamed/rotated files (a new folder will be created if it doesn't exist), the location where to save the final PDF document (saved as "out.pdf" if the no filename is specified); or the name of the PDF file (the *.pdf extension appended to the filename is not necessary but will be added automatically if not entered by the user). The option accepts both absolute and relative paths.

The renaming/rotating bit of the script is inspired by Matti Kariluoma and his ["RenameAll.exe"][46] script, which he wrote for the already mentioned [Cardboard Bookscanner][1] project appeared on Instructables.com.


## Homer installer for Mac ##

> view code: [install.command][mac-install-command-download]

The installation script `install.command` found inside the Homer disk image was written in bash and made executable by typing `chmod 755` and appending the `.command` extension in the filename. When the user double-clicks on it, Mac OS X automatically opens the Terminal.app window and runs the script. Depending on the ownership and permissions of the `/usr/local` folder, the script may require the user to authenticate as admin. 

The script runs the a  modified version of `homebrew.rb` installaiton script to allow an offline installation. That is, instead of downloading the tarball from GitHub, the script untars a local archive `mxcl-homebrew-3545a8d.tar.gz`, pre-downloaded from GitHub and included in the Homer installation package. If you wish to update homebrew to the latest version simply type `brew update` in the Terminal.app. 

Most of the included hombrew "formulas" would require XCode -- i.e. Apple's OSX Developer Tools -- in order to be compiled from their source code. However, we decided to distribute pre-compiled binaries along with the Homer package for Mac, so that you won't necessarily need to install XCode to run the Homer script on your Mac. To compile them we used Homebrew and XCode 4.1 running OS X 10.6.8 and 10.7.1, respectively for the Snow Leopard's and Lion's version of the Homer installer for Mac, which thus comprise two different packages for the two latest version of the OSX. We couldn't compile it for Mac OS X 10.5 Leopard, as the latter is not compatible with the MacBook Air. For the same reason, the software included is compatible only with Intel Macs like the Air, and not also for older PowerPC Macs. If you manage to compile it with older versions of OS X and older architectures, you are welcome to share here with us the results.

The package also include some pre-compiled Ruby gems (see the list below). However, these are not installed in the default `/Library/Ruby/Gems/1.8` folder, which is owned by `root:wheel` and would thus require another `sudo`, but inside Homebrew's `Cellar` directory in the `/usr/local` folder, whose group ownership is set to `admin` by Homebrew installation script, and therefore does not require the super user privileges (provided the user actually belongs to `admin` group). To this purpose, a RubyGem plugin called [Brewbygems][38] is installed. This adds post-install and post-uninstall hooks to RubyGems that update the symlinks in your Homebrew `/usr/local/bin/` folder. The user's RubyGems prefix is also changed to `/usr/local/Cellar/gems/1.8` by adding the corresponding `$GEM_HOME` variable to the `~/.bashrc` profile, so that every time you `gem install` anything you will no longer need to `sudo`.

Please note that if you have already another copy of Homebrew installed in `/usr/local`, or if you have installed any of the following programs with another package manager (e.g., MacPorts, Fink, etc.), but you still want to use the automatic installer, then it is advisable to completely remove all those programs before running the Homer installer, to avoid unexpected errors or conflicts. Alternatively, you can install the various programs manually and then download the standalone Homer bash script from [here][homer-standalone-download]. 

### Software included ###

The installation script installs the following programs into the specified locations:

- [**Homebrew**][37], the missing package manager for OS X: 

        /usr/local/bin/brew
        /usr/local/Library/Formula/...
        /usr/local/Library/Homebrew/...

- [**ImageMagick**][30], open source software suite for manipulating images, with its dependencies (version 6.7.1-1, binaries compiled through Homebrew): 

        /usr/local/Cellar/imagemagick/6.7.1-1/...
        /usr/local/Cellar/jpeg/8c/...
        /usr/local/Cellar/jasper/1.900.1/...
        /usr/local/Cellar/little-cms/1.19/...
        /usr/local/Cellar/libtiff/3.9.5/...

- [**JBIG2 encoder**][32], compression tool for bi-level images (binary compiled through Homebrew):

        /usr/local/Cellar/jbig2enc/0.27-17b36fa/...

- [**Tesseract-ORC**][23], free open source OCR engine sponsored by Google, with Leptonica library for enhanced image processing (version 3.00, binary compiled through Homebrew): 

        /usr/local/Cellar/tesseract/3.00/...
        /usr/local/Cellar/leptonica/1.68/...

- [**Brewbygems**][38], making RubyGems and Homebrew play nice together:
        
        /usr/local/Cellar/gems/1.8/gems/brewbygems-0.4.0/...

- [**Hpricot**][35], HTML parser (pre-compiled Ruby gem):

        /usr/local/Cellar/gems/1.8/gems/hpricot-0.8.4/...

- [**RMagick**][34], interface between the Ruby programming language and ImageMagick (pre-compiled Ruby gem):	

        /usr/local/Cellar/gems/1.8/gems/rmagick-2.13.1/...
        
- [**pdfbeads**][25], Ruby utility to create searchable PDF:

        /usr/local/Cellar/gems/1.8/bin/pdfbeads
        /usr/local/Cellar/gems/1.8/gems/pdfbeads-1.0.3/...

- [**Scan Tailor**][17], interactive post-processing tool for scanned pages (version 1.0.0beta11 with experimental "Dewarping" support):

        /Applications/ScanTailor.app
                
- [**Homer**][how to process the images], command-line script and GUI app (made with Automator) for renaming, rotating and binding scanned pages:

        /usr/local/bin/homer
        /Applications/Homer/Homer.app

## Homer installer for Windows ##

> view code: [Homer-Install.au3][win-homer-install-autoit]

The installation script `Homer-install-exe` for Windows was made using [AutoIT v3][39], a freeware BASIC-like scripting language designed for automating the Windows GUI. The installation script for Windows takes longer to complete than its Mac counterpart, as some of the programs to install need in this case to be compiled from source. Also, the script may require administrative privileges to run depending on the installed Windows OS version ("User Account Control" is enabled by default on Windows Vista and Windows 7).

AutoIT scripts allows to interact with the Windows GUI in the same way a user would do with his or her cursor and keyboard. We could have told the user to download each program and install through its own installer (when available, like in most cases for Windows programs). But we decided to make the procedure even easier, by automating the whole setup trough a "unattended" installation script. The user will only need to click "Install" once and then wait for the installation to complete.

The Homer script was originally written in Bash, which comes pre-installed in OSX and Linux, but not in Windows. Moreover, PDFbeads -- the utility to convert the images into PDF -- requires Ruby, which again is not pre-installed on Windows. Finally, PDFbeads requires two other Ruby gems (hpricot and RMagick) which need to be compiled from source with the developer tools. The solution to these problems is to install the [Development Kit][44] provided by the RubyInstaller project: the Ruby DevKit for Windows is based upon [MSYS and MinGW][45], which not only provide development tools to build native Ruby extensions or "gem", but also include the Bash command line interpreter system. This allows Windows users to run the same[^9] Homer bash script inside Windows Command Prompt.

The installer copy most of the software in an newly created `C:\opt` folder (except Scan Tailor which is installed in the default `C:\Program Files`). This is necessary because the command-line utilities work easily if they reside in a path without spaces.

Finally, the script also update the `%PATH%` environmental variable to include all the folders in C:\opt that contains binaries, thus making their execution smoother. Moreover, another variable is added to the registry for the current user: it's called `%DESKTOPDIR%`, and returns the path to the user's Desktop directory (e.g., `C:\Documents and Settings\cosimolupo\Desktop`). The latter is used by the Homer script to save the final PDF document in that location. It is simply trick to overcome the issue of Windows system folders' labels being dependent from the language currently in use: thus, the same folder is called "Desktop" in the English version, while "Scrivania" in the Italian one. 

If you have already installed any of the following programs, and still wish to use the automatic installer, we advise you to uninstall all those programs before running the automated installation script, in order to avoid any possible conflict. Otherwise, it is better to install all the applications manually and then download the standalone Homer bash script from [here][homer-standalone-download].

### Software included ###

The script install the following programs into the specified locations:

- [**ImageMagick**][30], open source software suite for manipulating images (official Windows binary installer version 6.7.0-10-Q16): 

        C:\opt\ImageMagick\

- [**jpegtran**][31], loseless jpeg transformations (as found inside the GNUWin32 build of [JPEG 6b-4][42] library for Windows):

        C:\opt\bin\jpegtran.exe
        C:\opt\bin\jpeg62.dll

- [**JBIG2 encoder**][32], compression tool for bi-level images (Windows version of agl's jbig2enc compiled by [RubyPDF software][43]):

        C:\opt\bin\jbig2.exe

- [**Tesseract-ORC**][23], free open source OCR engine sponsored by Google, with Leptonica library for enhanced image processing (version 3.00): 

        C:\opt\Tesseract-OCR\

- [**RubyInstaller**][40], the easy way to install the Ruby programming language on Windows (includes the Development Kit to build native C/C++ extensions or "gems" - Ruby version 1.87):

		C:\opt\Ruby187\
		C:\opt\DevKit\

- [**Hpricot**][35], HTML parser:

        C:\opt\Ruby187\lib\ruby\gems\1.8\gems\hpricot-0.8.4\

- [**RMagick**][34], interface between the Ruby programming language and ImageMagick:	

        C:\opt\Ruby187\lib\ruby\gems\1.8\gems\rmagick-2.13.1\
        
- [**pdfbeads**][25], Ruby utility to create searchable PDF:

		C:\opt\Ruby187\lib\ruby\gems\1.8\gems\pdfbeads-1.0.3\
		
- [**cmdow.exe**][41], command-line utility used in Homer batch script to activate the Command Prompt window upon completion:

        C:\opt\bin\cmdow.exe

- [**Scan Tailor**][17], interactive post-processing tool for scanned pages (version 1.0.0beta11 with experimental "Dewarping" support):

        C:\Program Files\ScanTailor\
                
- [**Homer**][how to process the images], command-line bash script (controlled via a Windows batch file) for renaming, rotating and binding scanned pages:

		C:\opt\bin\homer.cmd
		C:\opt\bin\homer.sh
		C:\Program Files\Homer\Homer.bat
		


[1]: http://www.instructables.com/id/Bargain-Price-Book-Scanner-From-A-Cardboard-Box/ "Bargain-Price Book Scanner From A Cardboard Box (from Instructables.com)" 
[16]: http://en.wikipedia.org/wiki/Jpegtran "libjpeg (from Wikipedia)"
[17]: http://scantailor.sourceforge.net/ "About | Scan Tailor"
[18]: http://sourceforge.net/apps/mediawiki/scantailor/index.php?title=Main_Page "Main Page | Scan Tailor Wiki"
[19]: http://sourceforge.net/apps/mediawiki/scantailor/index.php?title=Quick_Start_Guide "Quick Start Guide | Scan Tailor Wiki"
[20]: http://vimeo.com/12524529 "Scan Tailor Tutorial | Joseph Artsimovich on Vimeo"
[21]: http://en.wikipedia.org/wiki/Dots_per_inch "Dots per inches (from Wikipedia)"
[22]: http://www.google.com/search?client=safari&rls=en&q=centimeters+to+inches&ie=UTF-8&oe=UTF-8 "centimeters to inches - Google Search"
[23]: http://code.google.com/p/tesseract-ocr/ "Tesseract OCR"
[24]: http://en.wikipedia.org/wiki/HOCR "hOCR (from Wikipedia)"
[25]: http://rubygems.org/gems/pdfbeads "PDFbeads | RubyGems.org"
[26]: http://code.google.com/p/tesseract-ocr/downloads/list "Download List | Tesseract OCR"
[27]: http://acrobatusers.com/tutorials/better-pdf-ocr-clearscan-smaller-looks-better "Clear Scan: How it works"
[28]: http://en.wikipedia.org/wiki/JBIG2 "JBIG2 (from Wikipedia)"
[29]: http://scantailor.sourceforge.net/?q=en/node/3 "Download | Scan Tailor"
[30]: http://www.imagemagick.org/script/index.php "ImageMagick.org"
[31]: http://jpegclub.org/ "JPEGClub.org"
[32]: https://github.com/agl/jbig2enc "agl/jbig2enc - GitHub"
[33]: http://www.ruby-lang.org/ "Ruby Programming Language"
[34]: http://rmagick.rubyforge.org/ "RMagick Download Page"
[35]: http://rubygems.org/gems/hpricot "Hpricot | RubyGems.org"
[36]: http://www.diybookscanner.org/forum/ "DIY Book Scanning | A forum dedicated to book scanning, open source, DIY digitization"
[37]: http://mxcl.github.com/homebrew/ "Homebrew - MacPorts driving you to drink? Try Hombrew!"
[38]: https://github.com/indirect/brewbygems "indirect/brewbygems - GitHub"
[39]: http://www.autoitscript.com/site/ "AutoItScript Website"
[40]: http://rubyinstaller.org/ "RubyInstaller of Windows"
[41]: http://www.commandline.co.uk/cmdow/ "CMDOW Commandline Windows Utility for NT4/2000/XP/2003"
[42]: http://gnuwin32.sourceforge.net/packages/jpeg.htm "Jpeg for Windows"
[43]: http://soft.rubypdf.com/software/windows-version-jbig2-encoder-jbig2-exe "Windows verson of JBIG2 Encoder"
[44]: https://github.com/oneclick/rubyinstaller/wiki/Development-Kit "Development Kit - GitHub"
[45]: http://www.mingw.org/ "Minimalist GNU for Windows"
[homer-standalone-download]: http://dl.dropbox.com/u/189038/homer.sh "Homer bash script v1.0beta1"
[mac-install-command-download]: http://dl.dropbox.com/u/189038/install.command.txt "Homer installer script for Mac"
[win-homer-install-autoit]: http://dl.dropbox.com/u/189038/Homer-Install.au3.txt "Homer-Install.au3"
[46]: http://www.mattikariluoma.com/files/RenameAll.exe "RenameAll.exe | Matti Kariluoma"