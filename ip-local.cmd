@ECHO OFF
ipconfig.exe > ipconfig.txt
FIND "Gateway" "ipconfig.txt" > "ipconfig-gateway.txt" 
FOR /F "skip=2 tokens=2 delims=:" %%T IN (ipconfig-gateway.txt) DO ( 
 SETLOCAL EnableDelayedExpansion 
 set "LOCAL_IP=%%T" 
 set "LOCAL_IP=!LOCAL_IP:~1!"
 echo !LOCAL_IP!
)
DEL "ipconfig.txt"
DEL "ipconfig-gateway.txt"

