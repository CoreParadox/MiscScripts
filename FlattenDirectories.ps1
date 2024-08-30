Get-ChildItem -Recurse -File | ForEach-Object {
    Move-Item -Path $_.FullName -Destination (Get-Location)
}