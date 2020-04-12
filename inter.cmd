@ECHO OFF



::bitsadmin /transfer myDownloadJob /download /priority normal https://api.ipify.org "%cd%asd.txt"

SET "newDownload=%RANDOM%-inter"
echo %newDownload%
bitsadmin /create %newDownload%
echo %ERRORLEVEL%
bitsadmin /addfile %newDownload% "https://api.ipify.org" "%cd%\asd.txt"
echo %ERRORLEVEL%

bitsadmin /sethttpmethod %newDownload% get
bitsadmin /resume %newDownload% 
echo %ERRORLEVEL%


echo err count:
bitsadmin /RawReturn /geterrorcount "1472-inter" 
bitsadmin /getstate %newDownload%
echo %ERRORLEVEL%


timeout "5"

bitsadmin /geterror %newDownload%
echo %ERRORLEVEL%



 
bitsadmin /setnotifycmdline <job> exit

::https://gist.github.com/WiVi71/b0766dd658b50df5b873f676e3d128bd
::https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/bitsadmin-setnotifycmdline
::https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/bitsadmin-setnotifyflags



::bitsadmin /transfer "%RANDOM%" /DYNAMIC "https://api.ipifsdy.org" "%cd%\global-ip.txt" 2>>"bitsadmin-information.txt" 
::echo %ERRORLEVEL%


pause
