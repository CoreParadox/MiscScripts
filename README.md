# MiscScripts
Just some random scripts that are useful

## Directory Ops
* [FlattenDirectories.ps1](/DirectoryOps/FlattenDirectories.ps1)
    * Moves all files out of nested folders into working directory
    * Usage: `FlattenDirectories.ps1`
* [MoveFileContains.ps1](/DirectoryOps/MoveFileContains.ps1)
    * Prompts for target directory and a search string, moves all files into a folder named after the search string 
    * Usage: `MoveFileContains.ps1`
* [DeleteEmptyDirectories.ps1](/DirectoryOps/DeleteEmptyDirectories.ps1)
    * Deletes all empty directories in working directory, including ones with empty child directories, useful with [FlattenDirectories.ps1](/DirectoryOps/FlattenDirectories.ps1)
    * Usage `DeleteEmptyDirectories.ps1`
## AppSpecific
* [Razer](/AppSpecific/Razer/)
    * these scripts are mainly to work around bugs with the razer synapse 3 software, however they're mostly outdated since the new synapse beta software resolves these issues.
    *[kill-razer.bat](/AppSpecific/Razer/kill-razer.bat)
        * kills razer synapse processes
        * Usage: `kill-razer.bat`
    *[restart_synapse_on_wake.bat](/AppSpecific/Razer/restart_synapse_on_wake.bat)
        * Meant to be used with task scheduler, restarts razer synapse on wake from sleep to resolve unresponsive keybinds and game detection
        * Credit/Usage: [snuxs on Reddit](https://www.reddit.com/r/razer/comments/tfg0tj/simple_fix_for_synapse_3_bugging_after_sleep/)
    *[start-razer.bat](/AppSpecific/Razer/start-razer.bat)
        * starts razer synapse processes
        * Usage: `start-razer.bat`
## VideoProcessing
* [clip16-9.ps1](/VideoProcessing/clip16-9.ps1)
    * Crops the video from clipboard (either the path or item), from a higher resolution down to 16:9, useful for ultrawide recordings of games.
    * Usage: `clip16-9.ps1`
* [ytdl-shortcut.ps1](/VideoProcessing/ytdl-shortcut.ps1)
    * Downloads a video as mp3 or mp4 from the clipboard url, depending on the mode param (video/audio)
    * Usage: `ytdl-shortcut.ps1 audio/video`