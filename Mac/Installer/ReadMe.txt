Homer v1.0b1 Setup for Mac OS X 10.7.x Lion
by Cosimo Lupo (lupocos@gmail.com), September 2011

For more info visit http://bookscanner.pbworks.com/

The file `install.command` found inside this disk image is an executable Bash script. Simply double-click on it, and Mac OS X will automatically open the Terminal.app window and install the programs listed below. Depending on the ownership and permissions of the `/usr/local` folder, the script may require the user to authenticate as admin.

If you have already installed any of these programs, I advise you to uninstall them before running the automated installation script, to avoid any possible conflict. Alternatively, you could try to install all the needed applications manually and then download the standalone Homer bash script from http://bookscanner.pbworks.com/.

The script will install the following programs into the specified locations:

The installation script installs the following programs into the specified locations:

- Homebrew, the missing package manager for OS X: 

    /usr/local/bin/brew
    /usr/local/Library/Formula/...
    /usr/local/Library/Homebrew/...

- ImageMagick, open source software suite for manipulating images, with its dependencies (version 6.7.1-1, binaries compiled through Homebrew): 

    /usr/local/Cellar/imagemagick/6.7.1-1/...
    /usr/local/Cellar/jpeg/8c/...
    /usr/local/Cellar/jasper/1.900.1/...
    /usr/local/Cellar/little-cms/1.19/...
    /usr/local/Cellar/libtiff/3.9.5/...

- JBIG2 encoder, compression tool for bi-level images (binary compiled through Homebrew):

    /usr/local/Cellar/jbig2enc/0.27-17b36fa/...

- Tesseract-ORC, free open source OCR engine sponsored by Google, with Leptonica library for enhanced image processing (version 3.00, binary compiled through Homebrew): 

    /usr/local/Cellar/tesseract/3.00/...
    /usr/local/Cellar/leptonica/1.68/...

- Brewbygems, making RubyGems and Homebrew play nice together:
        
    /usr/local/Cellar/gems/1.8/gems/brewbygems-0.4.0/...

- Hpricot, HTML parser (pre-compiled Ruby gem):

    /usr/local/Cellar/gems/1.8/gems/hpricot-0.8.4/...

- RMagick, interface between the Ruby programming language and ImageMagick (pre-compiled Ruby gem):	

    /usr/local/Cellar/gems/1.8/gems/rmagick-2.13.1/...
        
- pdfbeads, Ruby utility to create searchable PDF:

    /usr/local/Cellar/gems/1.8/bin/pdfbeads
    /usr/local/Cellar/gems/1.8/gems/pdfbeads-1.0.3/...

- Scan Tailor, interactive post-processing tool for scanned pages (version 1.0.0beta11 with experimental "Dewarping" support):

    /Applications/ScanTailor.app
                
- Homer, command-line script and GUI app (made with Automator) for renaming, rotating and binding scanned pages:

    /usr/local/bin/homer
    /Applications/Homer/Homer.app