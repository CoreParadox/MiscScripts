param(
    [string]$mode = "video"
)

$folderPath = "D:/Downloads/Videos/YTDL"
$searchText = Get-Clipboard

# Create the folder if it doesn't exist
if (-not (Test-Path -Path $folderPath)) {
    New-Item -ItemType Directory -Path $folderPath
}
Write-Output "mode: $mode"
if ($mode -eq "audio") {
    yt-dlp --newline --extract-audio --audio-format mp3 -i -o "$folderPath/%(title).15s%(id).15s.%(ext)s" --restrict-filenames --ignore-config --hls-prefer-native $searchText
}
else {
    yt-dlp --newline -i -o "$folderPath/%(title).15s%(id).15s.%(ext)s" --restrict-filenames --ignore-config --hls-prefer-native $searchText
}

Start-Process $folderPath
