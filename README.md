## Ansible Playbooks for Installing IMC

These playbooks can be used to prepare Linux systems for installing IMC. This includes installing MySQL 5.6, setting up the DB, installing pre-requisite packages, updating iptables, etc.

To use these, edit the 'hosts' file, and set appropriate IPs for the MySQL server [imcmysql] and the IMC server [imcapp]. These may be the same IP.

Then run "ansible-playbook imcprep.yml -i hosts"

## Silent Install

There is also a playbook for performing a silent install of IMC. This will only work where the DB is installed on the same server as IMC.

You will need to download IMC, and copy the contents of linux/install to the IMC server, to /root/install. 

Then run ansible-playbook imcinstall.yml -i hosts

This script prepares everything for a silent install, but does not yet actually run the installer. Run /root/install/installer.tcl to start it off.


## To Do

* Change the imcinstall playbook to copy across the IMC binaries, and actually kick off the installer.
* The imcinstall playbook can then be updated to enable the checks for IMC autostart - currently it's commented out.
* Figure out how to tie this in with Vagrant so that it can do a complete automated lab build
* Figure out how to automate patching
* See if there's a better way to do the silent install, so that it can also work with multi-server setups, and configure components
* Add eAPI scripts to automate actual IMC configuration
