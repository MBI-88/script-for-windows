Write-Host "   [*]Scripts para la actualizacion de windows defender   "
$ruta = "C:\Program Files\Windows Defender"
Set-Location -Path "C:\Program Files\Windows Defender"

if ($ruta -eq (Get-Location ).Path){
Start-Process 'MpCmdRun.exe' -ArgumentList '/removedefinitions /dynamicsignatures'
Start-Process 'MpCmdRun.exe' -ArgumentList '/SignatureUpdate'
}
else {Write-Host "   [-]No se pudo encontrar la ruta especificada   "}