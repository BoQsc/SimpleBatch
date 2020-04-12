@ECHO OFF
 
WHERE curl > NUL
IF %ERRORLEVEL% EQU 0 (

	curl "https://api.ipify.org" -o "global-ip.txt" > NUL 2>NUL

)

IF %ERRORLEVEL% NEQ 0 (

	WHERE bitsadmin > NUL
	IF %ERRORLEVEL% EQU 0 (
		bitsadmin /transfer "%RANDOM%" /DYNAMIC "https://api.ipify.org" "%cd%\global-ip.txt">nul   
	)
   
	IF %ERRORLEVEL% NEQ 0 (
		ECHO bitsadmin binary was not found on your operating system, 
		ECHO your operating system is too old and does not include bitsadmin.exe utility.
	)


)

IF EXIST "global-ip.txt" (

	TYPE "global-ip.txt"        
	ECHO.                                            
	DEL "global-ip.txt"
) ELSE (

	ECHO "Data transfer unsuccessful"

)

pause   