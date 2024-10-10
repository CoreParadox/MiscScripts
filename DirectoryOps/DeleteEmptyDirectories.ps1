Get-ChildItem -Recurse -Directory | Where-Object {
    (Get-ChildItem -Path $_.FullName -Recurse | Measure-Object).Count -eq 0
} | Remove-Item -Recurse