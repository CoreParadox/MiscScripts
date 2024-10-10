$downloadPath = "D:/Downloads"
$searchText = Get-Clipboard
yt-dlp --newline --extract-audio --audio-format mp3 -i -o "$downloadPath/%(title).15s%(id).15s.%(ext)s" --restrict-filenames --ignore-config --hls-prefer-native $searchText
Start-Process $downloadPath
