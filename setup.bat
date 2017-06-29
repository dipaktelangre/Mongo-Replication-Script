@Echo Off
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)

call :colorEcho 0e "Creating the required folder"
echo.

mkdir c:\mongodata\inMemory\db
mkdir c:\mongodata\mmapv1\db
mkdir c:\mongodata\wiredTiger\db
mkdir c:\mongodata\inMemory\log
mkdir c:\mongodata\mmapv1\log
mkdir c:\mongodata\wiredTiger\log

call :colorEcho 0e "Copying config files"
echo.
copy rsconfig\*.* "C:\Program Files\MongoDB\Server\3.4"

call :colorEcho 0e "Creating Services"
echo.
sc.exe create MongoInMemory binPath= "\"C:\Program Files\MongoDB\Server\3.4\bin\mongod.exe\" --service --config=\"C:\Program Files\MongoDB\Server\3.4\inMemory.cfg\"" DisplayName= "MongoInMemory" start= "auto"
sc.exe create MongoWiredTiger binPath= "\"C:\Program Files\MongoDB\Server\3.4\bin\mongod.exe\" --service --config=\"C:\Program Files\MongoDB\Server\3.4\wiredTiger.cfg\"" DisplayName= "MongoWiredTiger" start= "auto"
sc.exe create MongoMmapv1 binPath= "\"C:\Program Files\MongoDB\Server\3.4\bin\mongod.exe\" --service --config=\"C:\Program Files\MongoDB\Server\3.4\mmapv1.cfg\"" DisplayName= "MongoMmapv1" start= "auto"

call :colorEcho 0e "Starting all services"
echo.
net start MongoInMemory
net start MongoWiredTiger
net start MongoMmapv1

call :colorEcho 0e "Initializing the replication "
echo.
"C:\Program Files\MongoDB\Server\3.4\bin\mongo" --port 40001 rsinit.js
ping 127.0.0.1 -n 3 > nul

"C:\Program Files\MongoDB\Server\3.4\bin\mongo" --port 40001 rsinit.js
echo.
call :colorEcho 0e "Adding mongo to path"
set PATH=%PATH%;"C:\Program Files\MongoDB\Server\3.4\bin"

echo.
call :colorEcho a0 "------------------------You all set !!---------------"
echo.
pause
exit

:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i

