# Define the process names associated with Razer Synapse
$processNames = @("Razer Synapse 3", "Razer Synapse Service", "GameManagerService", "Razer Central", "Razer Central Service", "Razer Synapse Service Process")

# Kill all processes associated with Razer Synapse
foreach ($processName in $processNames) {
    Get-Process -Name $processName | Stop-Process -Force
    Write-Output "Killed process $processName"
}

# Wait a moment to ensure all processes are terminated
# Start-Sleep -Seconds 5

# # Define the path to the Razer Synapse executable
# $razerSynapsePath = "C:\Program Files (x86)\Razer\Synapse3\WPFUI\Framework\Razer Synapse 3 Host\Razer Synapse 3.exe"

# # Check if the file exists
# if (Test-Path $razerSynapsePath) {
#     # Start Razer Synapse
#     Start-Process $razerSynapsePath
# }
# else {
#     Write-Output "Razer Synapse executable not found at $razerSynapsePath"
# }
