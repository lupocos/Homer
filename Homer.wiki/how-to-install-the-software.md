# How to install the software #

In order to use our book scanner, you need some software that is able to reorder the pages, fix their orientation, enhance their readability, recognize the text within them, and finally bind them into a single portable document. To do the job, there are of course several commercial applications -- e.g., [Adobe Acrobat][11] --, though these are usually quite expensive. On the other hand, there are as well many free programs that accomplish the same tasks, producing results that well bear comparison with those of the commercial solutions. The only downside is that they are often more difficult to install and use than their commercial counterpart, for they may require developer tools which don't come pre-installed on every systems, or may consit in so-called "command-line" utilities (i.e., lacking a graphical user interface or GUI). 

To transform the photos into a digital book, Homer makes use of an array of free, open-source softwares to tackle specific tasks, all of which are already available online. It just adds two simple things: first, it provides an automatic "installer" that makes the process of setting up almost effortless; second, it brings together the various pieces of software into a single workflow that automatically rearranges the images, applies the optical character recognition (OCR) engine, and finally merges the files into a single, searchable PDF.  

Here you will find Homer's donwload links for Windows and Mac OS X[^1]. You can read the complete list of the programs included the packages at the Documentation page (see the section for [Windows](/lupocos/Homer/wiki/homer-installer-for-windows) and [Mac](/lupocos/Homer/wiki/homer-installer-for-mac)). Before using the installer, we strongly recommend to check that none of the included programs are already installed on your machine, to avoid accidentally overwriting them (the script isn't clever enough yet). If you have already installed any of those programs, you should probably be expert enough to manage without an automatic installer. 

When you are ready, select the package that is compatible with your operating system and download it on your computer, then follow the relative instructions.

## Windows ##

- **Windows XP / Windows Vista / Windows 7** : [Homer-v1.0beta1-Win.zip][12]     
		`(size 165.5 MB - MD5 checksum: 92f14674e3952c8cf66fa5d0761b2cf4)`

Extract the content of the ZIP archive somewhere on your hard drive, then launch the installer called "Homer-install.exe", click "Install" and simply wait until the setup is finished. The process may take a while to complete, after which you will hear a sound alert and you will notice two new shortcuts appearing on your Desktop, called respectively "Homer" and "Scan Tailor". Note that on Windows Vista and Windows 7 the setup requires administrative privileges, so you will need to enter your user's password upon launching the installer. 

## Mac OS X ##

- **Mac OS X 10.6 Snow Leopard** : [Homer-v1.0beta1-Snow.dmg][13]    
		`(size 149.6 MB - MD5 checksum: 603196f357c1d356d090a0a574194707)`
		
- **Mac OS X 10.7 Lion** : [Homer-v1.0beta1-Lion.dmg][14]    
		`(size 148.8 MB - MD5 checksum: ed9711a17cb8d1ccefa806dfd3e8307a)`

Mount the disk image (double-click on the ".dmg" file), and then launch the shell script named "install.command". Enter your user's password if the installer requires you to do so, and wait one or two minutes until the setup is completed -- that is, when the icons of "Homer" and "Scan Tailor" appear in the Dock[^8].

## Linux ##

There is no Homer installer for the **Linux** platform (yet). However, since all the programs used by the Homer script were originally developed for Linux, it should not be difficult for Linux users to install them on their machine. Besides, the Homer script is written using the Bash scripting language, so it should be fully compatible with Linux or other *NIX based operating systems. We still did not have the chance to test Homer on Linux, but if you are a Linux user, please consult the [support][how you can help developing Homer] page for details about the software required to execute the Homer bash script, and let us know if it works.

## Uninstalling Homer ##

If you wish to remove Homer and all the supporting software, simply launch the uninstaller which is located in `C:\Program Files\Homer\Homer-uninstall.exe` on Windows, or `/Applications/Homer/uninstall.command` on Mac OS X. Your computer should return to its original state.
 


[11]: http://www.adobe.com/products/acrobat.html "Adobe Acrobat | create PDF, edit PDF"
[12]: http://dl.dropbox.com/u/189038/Homer-v1.0beta1-Win.zip "Download Homer 1.0beta1 for Windows"
[13]: http://dl.dropbox.com/u/189038/Homer-v1.0beta1-Snow.dmg "Download Homer 1.0beta1 for Mac OS X 10.6 Snow Leopard"
[14]: http://dl.dropbox.com/u/189038/Homer-v1.0beta1-Lion.dmg "Download Homer 1.0beta1 for Mac OS X 10.7 Lion"