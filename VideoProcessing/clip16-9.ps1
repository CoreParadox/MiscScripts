function Get-ClipboardFilePath {
    Add-Type -AssemblyName System.Windows.Forms
    if ([System.Windows.Forms.Clipboard]::ContainsFileDropList()) {
        $filePaths = [System.Windows.Forms.Clipboard]::GetFileDropList()
        return $filePaths[0]
    } else {
        return $null
    }
}

$filePath = Get-ClipboardFilePath

if ($filePath) {
    $fileName = [System.IO.Path]::GetFileNameWithoutExtension($filePath)
    $fileDirectory = [System.IO.Path]::GetDirectoryName($filePath)
    $outputFile = "$fileDirectory\$fileName`_output_16_9.mp4"
    ffmpeg -i $filePath -vf "crop=in_h*16/9:in_h:(in_w-out_w)/2:0" -c:a copy $outputFile
    Write-Output "Resized to: "$outputFile
} else {
    Write-Output "No file path found in clipboard."
}