' Get command-line arguments
Set objArgs = WScript.Arguments

' Check if the required arguments are passed
If objArgs.Count < 1 Then
    WScript.Echo "Usage: run-powershell.vbs <path to PowerShell script> [arguments]"
    WScript.Quit 1
End If

' Get the PowerShell script and any additional arguments
scriptPath = objArgs(0)
If objArgs.Count > 1 Then
    args = ""
    For i = 1 To objArgs.Count - 1
        args = args & " " & objArgs(i)
    Next
Else
    args = ""
End If

' Run the PowerShell script with hidden window
Set objShell = CreateObject("WScript.Shell")
objShell.Run "powershell.exe -ExecutionPolicy Bypass -File """ & scriptPath & """" & args, 0, False
