# persistance_backdoor
Windows Persistance Backdoor (Over administrative shares)
# What is it?
It's batch (cmd) file that create a backdoor which use the native features of windows. Creates an admin account with password admin0 and adds it to administrative group, then enable administrative shares. Once the script is run, full access to the disk drives of the victim computer over the network is provided.
# Installing
Just run the script on victim computer with administrative privileges. 
# Access To Victim Computer
The address \\ip\c$ gives the attacker full access (including write) on the victim computer's c drive. In addition, the admin:admin0 account used for access is hidden on the computer that created it. It does not appear in the login screen and control panel. The script also adds the required firewall rule for samba by disabling user account control.
# Uninstalling
Just run uhadmin.bat Its revert all registry settings and drop admin account.
# Tested on
Windows 10 64
