# Creates a network share from the current working directory
# with the name 'vagrantworkspace'. Also sets up permissions
# such that common user accounts can access it over the network
# so that IIS running inside a Vagrant VM can access it.
#
# This is mainly a workaround for Virtualbox shared folders
# which do not properly work. DO NOT point IIS at Virtualbox
# shares as it may look to be working but they do not. You've
# been warned.

Write-Output "Setting up a network share for guest"
$username = $args[0]
$password = $args[1]
$shareName = "vagrantworkspace"
$sharePath = $args[2]
$share = "\\${env:COMPUTERNAME}\$sharename"
$shares=[WMICLASS]"WIN32_Share"

If (!(GET-WMIOBJECT Win32_Share -filter "name='${shareName}'")) {
    Write-Output "Setting up share for local development"
    $shares.Create($sharePath,$shareName,0)
    $acl = Get-Acl $share
    $permission = "${env:USERDOMAIN}\${env:USERNAME}","FullControl","Allow"
    $accessRule = New-Object ` System.Security.AccessControl.FileSystemAccessRule ` $permission
    $acl.SetAccessRule($accessRule)
    $permission = "${env:USERDOMAIN}\domain users","FullControl","Allow"
    $accessRule = New-Object ` System.Security.AccessControl.FileSystemAccessRule ` $permission
    $acl.SetAccessRule($accessRule)
    $permission = "vagrant","FullControl","Allow"
    $accessRule = New-Object ` System.Security.AccessControl.FileSystemAccessRule ` $permission
    $acl.SetAccessRule($accessRule)
    $acl | Set-Acl $share

    Write-Output "Created new share ${share} on folder ${sharePath} with following permisions:"
    $acl | fl *
} else {
    Write-Output "Share already exists. Moving on."
}
exit 0