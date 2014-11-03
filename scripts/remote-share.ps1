# Connect to a remote UNC share
$username = $args[0]
$password = $args[1]
$share = "\\${env:COMPUTERNAME}\vagrantworkspace"

# Issue the following over a remote session
$guest_path = "c:\vagrant-smb"
$res = net use * "${share}" /user:"${username}" "${password}" /persistent:yes
$mapped_drive = (($res -match "\w:") -split (" "))[1]
cmd /c  mklink /d $guest_path  $mapped_drive