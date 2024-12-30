$whitelist = @(
    "FontCache"
)
$confirmation = Read-Host "Are you Sure You Want To Proceed? Ensure your whitelist contains ALL service names of which you want the startup type preserved. (y/n)"
if ($confirmation -eq 'y') {

    & Get-WmiObject win32_service -Filter "StartMode = 'Unknown' OR StartMode = 'Auto'" | Select Name, DisplayName, StartMode | Sort Name | ForEach-Object {
        $ServiceName = $_."Name" -replace "`n",", " -replace "`r",", "
        if(!$whitelist.Contains($ServiceName)){
            Write-Host $ServiceName' Not found in whitelist, setting to Manual' -foreground yellow
            Get-Service -Name $ServiceName | Set-Service -StartupType Manual
        }else{
            Write-Host $ServiceName' found in whitelist, startup type was not modified' -foreground darkgray
        }
    }
    Write-Host "Completed" -foreground green

}else{
    Write-Host "Operation Cancelled." -foreground red
}