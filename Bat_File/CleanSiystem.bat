@echo off

echo *************************************************************
echo [*] Programa para el mantenimiento y reparacion del sistema
echo *************************************************************          


:Inicio
choice /c sdlie /d e /n /t 25 /m "[*] Seleccione una opcion (S)--reparcion sistema  (D)--reparacion hdd  (L)--limpieza sistema  (I)--inforacion sistema (E)--salir: "

if errorlevel 5 goto  End
if errorlevel 4 goto SysInfo
if errorlevel 3 goto  Limpieza
if errorlevel 2 goto  Disco
if errorlevel 1 goto Sistema

:Sistema
echo [*] Analizando el sistema
sfc /scannow
dism /online /cleanup-Image /CheckHealth
dism /online /cleanup-Image /ScanHealth
dism /online /cleanup-Image /RestoreHealth
pause
goto Inicio

:Limpieza
echo [*] Limpiando la basura del sistema
set temp=C:\Windows\Temp
set temp2=C:\Users\%USERNAME%\AppData\Local\Temp
set prefetch=C:\Windows\Prefetch

forfiles /p %temp% /m * /c "cmd  /c  rd /q  /s @path"  && forfiles /p %temp% /m * /c "cmd  /c  del  /q  /s @path"
forfiles /p %temp2% /m * /c "cmd  /c  rd /q  /s @path" && forfiles /p %temp2% /m * /c "cmd  /c  del  /q  /s @path"
forfiles /p %prefetch% /m * /c "cmd /c del /q /s @path"

cleanmgr /sageset:1
cleanmgr /sagerun:1
wevtutil cl Application
wevtutil cl Setup
wevtutil cl System
wevtutil cl Security
pause
goto Inicio

:Disco
echo [*] Chequeando el estado del  hdd 
set /p valor="Ponga letara de la unidad a chequera ejemplo (C:) : >_"
chkdsk /f %valor%
pause
goto Inicio

:SysInfo
systeminfo /fo "List" >> C:\Users\%USERNAME%\Documents\SystemInfo.txt
getmac >> C:\Users\%USERNAME%\Documents\SystemInfo.txt
type C:\Users\%USERNAME%\Documents\SystemInfo.txt
pause
goto Inicio

:End
exit
