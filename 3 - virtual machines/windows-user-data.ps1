<powershell>
# // disable windows firewall
Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled False

# // create a user https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.localaccounts/new-localuser?view=powershell-5.1

$n1 = "${jonusername}"
$p1 = '${jonpassword}'
$n2 = "${rasmususername}"
$p2 = '${rasmuspassword}'
$n3 = "${geertusername}"
$p3 = '${geertpassword}'

$jonpassword = ConvertTo-SecureString $p1 -AsPlainText -Force
$rasmuspassword = ConvertTo-SecureString $p2 -AsPlainText -Force
$geertpassword = ConvertTo-SecureString $p3 -AsPlainText -Force

New-LocalUser -Name $n1 -Password $jonpassword
new-LocalUser -Name $n2 -Password $rasmuspassword
new-LocalUser -Name $n3 -Password $geertpassword

Add-LocalGroupMember -Group "Administrators" -Member $n1
Add-LocalGroupMember -Group "Administrators" -Member $n2
Add-LocalGroupMember -Group "Administrators" -Member $n3

# // enable rdp...? 

Add-LocalGroupMember -Group "Remote Desktop Users" -Member $n1
Add-LocalGroupMember -Group "Remote Desktop Users" -Member $n2
Add-LocalGroupMember -Group "Remote Desktop Users" -Member $n3

# disable NLA for RDP
(Get-WmiObject -class "Win32_TSGeneralSetting" -Namespace root\cimv2\terminalservices -ComputerName $env:ComputerName -Filter "TerminalName='RDP-tcp'").SetUserAuthenticationRequired(0)

# // etc
# Define the download URL and the destination
# $braveUrl = "https://brave-browser-downloads.s3.brave.com/latest/brave_installer-x64.exe"
# $destination = "$env:TEMP\brave_installer.exe"

# # Download the Brave installeryes
# Invoke-WebRequest -Uri $braveUrl -OutFile $destination

# # Install Brave silently
# Start-Process -FilePath "$env:TEMP\brave_installer.exe" -ArgumentList "/S"

# $puttyurl = "https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.80-installer.msi"
# $puttyargs = "/i putty-64bit-0.80-installer.msi /qn"
# $puttydestination = "$env:TEMP\putty-64bit-0.80-installer.msi"

# Start-Process -FilePath $puttydestination -ArgumentList $puttyargs


# # install SmartConsole

</powershell>