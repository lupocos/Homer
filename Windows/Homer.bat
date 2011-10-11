@ECHO OFF
mode con:cols=80 lines=43
cls
set DirPath=%1
:START
ECHO.
ECHO.
ECHO.
ECHO    Welcome to HOMER!
ECHO.
if not [%1]==[] goto SCRIPT
if [%1]==[] goto FINDIT
:FINDIT
ECHO. 
ECHO Please enter the path to the input directory (i.e., the one where the images to be processed are located), or simply drag and drop it here.
ECHO Enter "help" for further info:
SET /P DirPath=
IF [%DirPath%]==[] GOTO QUIT
IF [%DirPath%]==[help] GOTO HELP
:SCRIPT
bash homer %DirPath%
GOTO RESULT
:HELP
cls
echo Homer v1.0b1, Sept 2011
echo by Cosimo Lupo (lupocos@gmail.com, http://bookscanner.pbworks.com/)
echo.
echo   The script loads a directory of images which is expected to contain 2n files,
echo and applies to them a series of manipulations. 
echo   First, it allows to reorder a batch of JPEG images such that the first half 
echo and the second half are interspersed: that is, the first half is renamed with 
echo incremental odd numbers, while the second half is renamed with incremental even
echo numbers.
echo   Besides, the script allows to fix the orientation of the JPEG images by rota-
echo ting the pages on the right-hand side of book 90 degrees clockwise, and those 
echo on the left-hand side of the book 90 degrees counterclockwise.
echo   Finally, it runs \"Tesseract OCR\", the open source optical character re-
echo cognition software, to extract the text from a batch of TIFF images , and then
echo uses "PDFbeads" to bind the images and the text into a single, searchable PDF
echo (http://code.google.com/p/tesseract-ocr, http://rubygems.org/gems/pdfbeads).
echo The renaming/rotating bit of the script is inspired by Matti Kariluoma's
echo "RenameAll.exe" (http://www.mattikariluoma.com/files/RenameAll.exe) from the 
echo Cardboard Bookscanner project, Jan 2010 (http://www.instructables.com/id/
echo Bargain-Price-Book-Scanner-From-A-Cardboard-Box).
ECHO.
ECHO Press any key to continue...
pause > nul
cls
GOTO FINDIT
:RESULT
del %TMP%\firstline.txt 2> nul
cd %DirPath%
head -1 "namefile.txt" > %TMP%\firstline.txt 2> nul
set /p NAMEFILE=<%TMP%\firstline.txt
set OUTPUT=%NAMEFILE%.pdf
IF exist "%DESKTOPDIR%\%OUTPUT%" goto OCRSUCCESS
IF exist %DirPath%\renamed goto RENAMESUCCESS
goto QUIT
:RENAMESUCCESS
cmdow @ /ACT 2> nul
ECHO.
ECHO Completed! Press any key to show the "renamed" folder...
pause > nul
explorer "%DirPath%\renamed" & GOTO END
:OCRSUCCESS
cmdow @ /ACT 2> nul
ECHO.
ECHO Completed! Press any key to view the PDF file...
pause > nul
start "" "%DESKTOPDIR%\%OUTPUT%" & del namefile.txt & del mv-log.txt & goto END
:QUIT
cmdow @ /ACT 2> nul
ECHO.
ECHO Press any key to quit...
pause > nul
:END