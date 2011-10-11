# How you can help developing Homer #


### Try it now! ###

If you want to help us, you could test the Homer software package on your Mac or PC to see if it works accordingly. Here is a compressed ZIP archive containing some test scanned images taken from a printed version of this Wiki. You can use these photos to test the software before deciding whether you are interested or not in building the single-camera cardboard-box scanner.

> download: [Homer-TestImages.zip][test-images-donwload]

Follow the [instructions above](/lupocos/Homer/wiki/how-to-process-the-images) and at the end of the process you should end up with a PDF document featuring selectable text, which you should be able to copy and paste in another text document.

If you experience any errors during the installation or the usage of the Homer script and its supporting software, please report them to this page.


### Test it on Linux (or other OS) ###
 
Another way you could help us is to test the Homer bash script on a Linux machine. You can download the standalone bash script from [this link](/lupocos/Homer/wiki/documentation).

The script requires the following packages:

- [ImageMagick][30]
- [jpegtran][31] (included in libjpeg)
- [jbig2enc][32]
- [Ruby][33]
- [RMagick][34], [hpricot][35] and [PDFbeads][25] ruby gems
- [Tesseract OCR][23] ([additional languages][26] have to be manually insalled in the 'tessdata' folder)

While Scan Tailor is not strictly required to run the Homer bash script, you may find it useful to test the Tesseract + PDFbeads step. The source code of Scan Tailor for GNU/Linux can be downloaded from [here][29], but there must also be available .deb or .rpm packages in some repository. You may also find useful to consult the [DIYBookScanner Forum][36] for help about related issues.

Let us know if you manage to make it run!

 [test-images-donwload]: http://dl.dropbox.com/u/189038/#
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