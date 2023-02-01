$secpasswd = ConvertTo-SecureString "Password123!" -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential ("john", $secpasswd)
$computer = "steelmountain"
[System.Diagnostics.Process]::Start("C:\Temp\nc.bat","", $mycreds.Username, $mycreds.Password, $computer)
