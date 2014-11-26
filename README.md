**WARNING:** This plugin is a work in progress and is not yet available for use
<hr />

# Vagrant SMB Share Plugin

Vagrant plugin to automatically create and connect to a UNC share.

There is currently an [issue](https://github.com/mitchellh/vagrant/issues/3699) with Vagrant on Windows Guests that prevent the [SMB Synced Folders]() capability from working correctly.

Additionally, Virtualbox shared folders are sub-optimal for use as IIS source paths (see http://stackoverflow.com/questions/22636106/iis-application-using-shared-folder-in-virtualbox-vm).

This plugin will:

* Create a local share in the current working directory
* Set permissions so that the share may be accessed
* Mount the share on guest machine at `c:\vagrant-smb`

These settings are configurable.

## Getting started

vagrant plugin install vagrant-smb
