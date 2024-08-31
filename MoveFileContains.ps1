$sourceFolder = Read-Host "Enter the path of the source folder"; 
$searchString = Read-Host "Enter the search string"; 
$destinationFolder = Join-Path $sourceFolder ($searchString.TrimStart(".") + "."); 

if (-not (Test-Path -Path $destinationFolder)) { 
    New-Item -ItemType Directory -Path $destinationFolder 
}

function Move-Files { 
    param ([string]$currentSourceFolder); 
    
    $filesToMove = Get-ChildItem -Path $currentSourceFolder -File -Filter "*$searchString*"; 
    
    foreach ($file in $filesToMove) { 
        $relativePath = $file.FullName.Substring($sourceFolder.Length).TrimStart("\")
        $destinationFilePath = Join-Path $destinationFolder $relativePath.Replace(":", "")
        
        $destinationDir = Split-Path -Path $destinationFilePath -Parent
        
        if (-not (Test-Path -Path $destinationDir)) { 
            New-Item -ItemType Directory -Path $destinationDir 
        }
        
        Move-Item -Path $file.FullName -Destination $destinationFilePath
        Write-Host "Moved $($file.Name) to $destinationDir"
    } 
    
    $subDirs = Get-ChildItem -Path $currentSourceFolder -Directory 
    foreach ($subDir in $subDirs) { 
        Move-Files -currentSourceFolder $subDir.FullName 
    } 
}

Move-Files -currentSourceFolder $sourceFolder
