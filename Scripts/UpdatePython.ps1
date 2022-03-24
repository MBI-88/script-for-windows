function UpdatePython{
$modulos = pip freeze
foreach($PSItem in $modulos){pip install -U $PSItem.split('==')[0]}
pip freeze
pip check
pause
}
Try{
Activate.ps1
}Catch{
Write-Host "No se pudo activar el ambiente"
exit
}
UpdatePython
deactivate