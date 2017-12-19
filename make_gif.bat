@echo off

rem Annotating Date from exif Data
echo Annotating Date on Photos...
for /F "delims=" %%a in ('"dir /b /s | findstr /e .JPG"') do (
	convert %%~nxa -resize 500x500 %%~nxa	
	convert %%~nxa -gravity Southeast -pointsize 20 -fill white -annotate +10+5 "%%[EXIF:DateTime]" %%~nxa
	)

echo Creating the .gif file...
convert -set delay 20 -colorspace GRAY -colors 256 -dispose 1 -loop 0 *.jpg Output.gif
echo Done!
echo Press any key to exit...
pause>NUL
