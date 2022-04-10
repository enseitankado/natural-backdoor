# persistance_backdoor
Creates persistance backdoor over administrative shares on Windows boxes
# What is it?
It's batch (cmd) file that create a backdoor which use the native features of windows. It does not create any suspicious anomaly indication in the system. It does not get caught by standard antivirus and firewalls. Once the script is run, full access to the disk drives of the victim computer over the network is provided. Script creates an admin account with password admin0 and adds it to administrative group, then enable administrative shares. 
# Installing
Just run the script on victim computer with administrative privileges. 
# Using
The address \\ip\c$ gives the attacker full access (including write) on the victim computer's c drive. In addition, the admin:admin0 account used for access is hidden on the computer that created it. It does not appear in the login screen and control panel. The script also adds the required firewall rule for samba by disabling user account control. The script prompts for a alias for the target computer before it finishes running. The alias entered is saved at the end of the hadmin.bat file along with the mac address of the computer where the script is run. This mac address is stored to identify the victim computer on the network. Then, by performing a network scan, the IP address of the target computer can be obtained from the recorded mac address.
# Uninstalling
Just run uhadmin.bat with administrative privileges Its revert all registry settings and drop admin account.  The control computer can still continue to access the victim computer via the open session. However, this access authorization will be completely lost when the computer is restarted.
# Tested on
Windows 10 64
