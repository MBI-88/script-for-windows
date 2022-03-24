Write-Host "       ********Programa para reparcion del Sistema********      "
write-host "                                                                "

$Global:temp = "C:\Windows\Temp"
$Global:temp2 = "C:\Users\$env:USERNAME\AppData\Local\Temp"
$Global:prefetch = "C:\Windows\Prefetch"


function ReparaSystema{
Write-Host "[*] Analizando el sistema..."

Repair-WindowsImage -Online -RestoreHealth

pause

}

function LimpieszaSystema{
Write-Host "[*] Analizando archivos basura..."

Get-ChildItem $Global:temp -Recurse | Remove-Item -Recurse -Force
Get-ChildItem $Global:temp2 -Recurse | Remove-Item -Recurse -Force
Get-ChildItem $Global:prefetch -Recurse | Remove-Item -Recurse -Force

Start-Process -FilePath 'CleanMgr.exe' 
Clear-EventLog -LogName Application
Clear-EventLog -LogName HardwareEvents
Clear-EventLog -LogName System
Clear-EventLog -LogName Security

pause

}

function HDD{
[string]$hdd = Read-Host "[*] Ponga letra de la unidad >_ "

Repair-Volume -DriveLetter $hdd -OfflineScanAndFix
pause

}

function InfoSystem{
Write-Host "[*] Analizando informacion del sistema..."

Get-ComputerInfo >> C:\Users\$env:USERNAME\Documents\SystemInfo.txt
Get-NetAdapter | Select-Object -Property Name,MacAddress,Status >> C:\Users\$env:USERNAME\Documents\SystemInfo.txt
Get-Content C:\Users\$env:USERNAME\Documents\SystemInfo.txt

pause

}


while($true){
Switch ((Read-Host "Selecciona opcion (S)-reparacion (D)-reparacion Hdd (L)-limpiar systema (I)-informacion (E)-salir: ").ToLower()){
 "s" {ReparaSystema}
 "d" {HDD}
 "l" {LimpieszaSystema}
 "e" {Write-Host "Saliendo del programa..." 
  exit}
 "i" {InfoSystem}
 default {Write-Host "Vuelva a introducir una accion valida.."}
 
 }
}



