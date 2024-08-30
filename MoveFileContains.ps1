$sourceFolder = Read-Host "Enter the path of the source folder"
$searchString = Read-Host "Enter the search string"


$destinationFolder = Join-Path $sourceFolder ($searchString.TrimStart(".") + ".")

if (-not (Test-Path -Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder
}

$filesToMove = Get-ChildItem -Path $sourceFolder -File -Filter "*$searchString*"

foreach ($file in $filesToMove) {
    Move-Item -Path $file.FullName -Destination $destinationFolder
    Write-Host "Moved $($file.Name) to $destinationFolder"
}

Write-Host "Moved all matched files."
