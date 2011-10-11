# How to process the images #

Once you have shot all your photos, download them inside a new folder on your PC or Mac. Now launch the application called "Homer", which Windows users should find on their Desktop (it is in fact a shortcut), while Mac users find on the Dock. From here you have to select the input folder containing the images to be renamed and rotated. 

Homer for Mac displays a dialog window from where you can browse your hard drive and find the wanted folders, whereas the Windows version immediately starts within the Command Prompt, and asks you to enter the "path" to the input folder (e.g., `"C:\Documents and Settings\cosimolupo\Desktop\input-folder"`). But there's no need to be scared of the black window. Both Windows and Mac users can "drag and drop" the folder onto the icon of the Homer script, which will then regard it as input for processing. And Windows users don't need to digit the full path, but can also drag and drop the directory containing the images on the Command Prompt window itself. The OS will then take care of inserting the right path (enclosed in quotes if containing spaces).

After you have selected the input folder, you will be prompted to choose among four alternative options. The first two allows to rename and rotate the images depending on whether you started scanning from the right- or from the left-hand pages; the third option is for renaming the images without rotating them (a quicker option for those who prefer using Scan Tailor to rotate the images after that); finally, the fourth option is for running the text recognition software (Tesseract OCR) and for converting the files into a single, searchable PDF. Between the first three options for reordering, and the fourth one for converting to PDF, stands a middle step, which is perhaps the most important one and which cannot be included in the Homer script, not only because it is too complex but also because there is already a full-blown application for that, which happens to be free too: the middle step consist in "post-processing" the images, and the application is called [Scan Tailor][17], available on all operating systems.

## Step 1: Renaming and rotating ##

When you press "1" or "2" on Homer's startup menu, all the images inside the input folder are automatically renamed and rotated according to your preferences. The original files are left untouched, while the renamed files are saved in a new folder inside the input one. The script renames and rotates about 2 images per second on average, depending on the speed of your computer. 

In order to rotate the images, Homer uses a program called [jpegtran][16], a command-line utility included in the libjpeg library, which has the advantage of performing "lossless" transformations: that is, the rotation is done "without decompressing and recompressing the data, and so causing a reduction of image quality due to generation loss" [^4].

## Step 2: Post-processing with Scan Tailor ##

Scan Tailor is a truly powerful tool for enhancing the quality of scanned images, making them more readable, more similar to print than mere digital photos of a book. Its developer, Joseph Artsimovich, defines it as

> An interactive post-processing tool for scanned pages. It performs operations such as page splitting, deskewing, adding/removing borders, and others. You give it raw scans, and you get pages ready to be printed or assembled into a PDF[^5]. 

Here we will not try to explain in detail how to use such a complex program. For that, there is already the [Scan Tailor Wiki][18] page, which includes a User Guide as well as [video tutorials][20]. Here we will only give a few brief instructions in order to obtain acceptable results without too many troubles. Actually, the best place to start is the ["Quick Start Guide"][19] on the same official wiki. What follows is basically a paraphrase from the latter.

1. Lauch ScanTailor and select 'New project' to begin with a new set of images.
2. Browse to select the directory that contains the images you wish to process.
3. ScanTailor will create by default an 'out' directory for processed images placed inside the input directory. Leave it like that.
4. At the next stage it’s necessary to set the "dots-per-inch" ([DPI][21]) level. Click on 'All pages', and use the 'Custom' drop-down menu to select '300 x 300' [^6]. 
5. We may skip the 'Fix orientation' step if we have already rotated the images using jpegtran.
6. Click to ‘Split pages’, and Scan Tailor will try to autodetect the page layout. In our case, with a single-camera book scanner taking one page at a time, the correct option is the central one  in the Page Layout section (i.e., single page with something to crop at the edges). Then click on the `>` arrow to have ScanTailor batch process the remainder of the images according to the selected Page Layout option. You should always inspect individual pages in the thumbnails to the right of the main page, in order to prevent Scan Tailor from cutting away some portion of text or image. Clicking on a thumbnail will load that page to the main area and allow for manual adjustment of various parameters.
8. After having splitted the pages, you need to 'deskew' or straighten up the inclination of the pages such that the text is correctly aligned. Once again use the `>` arrow to batch process as needed and use the thumbnails to quickly check each page.
9. Click on 'Select content' and batch process (`>` right arrow), while always keeping an eye on the thumbnails. If something is not selected you should adjust it manually, by selecting the thumbnail and resizing the content box in the main page as needed (by dragging its edges). If no content is selected a content box may be manually entered by selecting that image and right-click in the main window, 'Add content box'. Likewise one may remove a content box from a page by right-click and 'Delete'.
10. Then move to the 'Margins' section and adjust the various parameters according to your requirements. ScanTailor defaults work well for most cases. Again, click the `>` arrow and then go on to the final step.
11. In the 'Output' section, you can select the type of image output desired. Black and white will produce a clean output image for simple text and line drawings. If some text appears to be 'missing' try increasing the line thickness to see if it appears. Once you choose your settings, these may be applied to all pages and run through the batch process (`>` arrow). Alternatively for images with photographs or graphics you may select 'mixed' or even 'colour/grayscale'. Our recommendation is to stick to black & white whenever is possible, so that the file will load faster and have a smaller size; and to select either 300 or 400 DPI as 'Output resolution', that is, about the same as the input one (600 is maybe too much for simple text). Anyway, it's always better to check the thumbnails -- particularly at this final stage --, to make sure that the required content is not excluded by mistake.
12. The 'output' batch process is usually the one that take the longest to complete, depending on the overall performaces of your computer. Set up Scan Tailor to 'beep when finished' and go have a coffee or tea. The output files will be saved as TIFF in the default 'out' directory inside the 'renamed' directory.

## Step 3: Applying Tesseract OCR and converting to PDF ##

The third and last stage of the overall procedure is in turn comprised of two smaller steps: first, we need to apply to our pictures the optical character recognition (OCR) engine, so that the text contained in them will lend itself to be copied & pasted in our word processor, or highlighted and searched in our PDF viewer; secondly, we want to combine the scanned images and the OCR-ed text thus produced into a single, portable document that will retain the appearance of the images but will include an invisible layer of text underneath.

In order to recognize the text from the images, Homer employs another free software, currently sponsored by Google, called [Tesseract][23]. This OCR engine was originally developed as proprietary software at Hewlett-Packard, and has been released as open source a few years ago. It is compatible with all three major operating systems and, as of version 3.00, it supports as many as 35 languages. Did I say it's *free*?

Now, the output of Tesseract are HTML files text encoded in the [hOCR][24] format, but that's not yet a PDF. For binding together the TIFF images and the HTML files Homer uses [PDFbeads][25], a small Ruby utility developed by Alexey Kryukov. Besides creating a searchable PDF, the program also compresses any b/w TIFFs using the [JBIG2][28] encoder, a very efficient image compression standard: for example, a book of 384 pages is contained in a single PDF file of 11.8 MB (including front and back covers in colour, and several illustrations in 'mixed' mode).

Both Tesseract and PDFbeads are command-line utilities, so they are well suited to be run through a bash script. As we have already mentioned, the option number "4" in the Homer script is meant to run Tesseract OCR on the "out" folder -- the one containing the TIFF images processed by Scan Tailor --, and eventually merge those images and their OCR-ed text into a searchable PDF.

This is done in the same way as for the renaming-rotating task. That is, by draggin the "out" folder on Homer's icon (or on the Command Prompt window), and then selecting the option "4". The script will prompt you to specify two variables before starting the process:

1. the **language** in which the scanned pages are written, identified by its three-characters label. To view the complete list of Tesseract supported languages inside Homer window, leave the field blank and press `ENTER` (you can also read the [list][26] online). For each languange there is a corresponing three-characters label in Tesseract's vocabulary: English is "eng", Italian is "ita", Portuguese is "por", etc. We didn't modify the labels, but used the default ones from Tesseract (don't blame us if Spanish is "spa" and not "esp", while French is "fra" and German is "deu"…). 

2. the **name of the final PDF**: you don't need to append the ".pdf" extension, it is added automatically; the filename may contain spaces; the file will be saved on the Desktop by default.

Text recognition may take 1 or 2 seconds per page on average, even more if colour/greyscale. You can watch the ongoing process on the Terminal or Command Prompt window -- but it's a boring sequence of "Processed image 0234.tif, etc.". When the process is finally completed, the window will come to foreground and you will be able to "press any key" to show the results!

Note that the quality of the text recognition may vary according to various factors like the quality the original shots, their resolution, the sort of typeface which is used in the printed book, and so on. If you are not satisfied with Tesseract and are willing to spend a few hundred pounds on it, we would recommend to try Adobe Acrobat (either Standard or Professional), not only for its quite good OCR engine but, above all, for its state-of-the-art [ClearScan][27] technology which turns pixelated images of text characters into smoothed "vector" curves. In other words, for each set of scanned images it creates a custom font matching the visual appearance of the printed text characters and embeds it into the PDF. Not just it looks better, but also produces smaller files that loads/scrolls faster on a PDF viewer than common "raster" graphics.

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