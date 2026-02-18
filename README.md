# net_connectivity_tools
net_connectivity_tools

+-------------------------------------------------+
|           NET_CONNECTIVITY_TOOLS                |
+-------------------------------------------------+

Author: Steven Lizama
Company: slworkcontact@gmail.com
License: MIT License
You may freely distribute these scripts, but please keep this README and attribution intact.
Version: v1
Date: 2026-01-12


A set of lightweight Windows batch scripts for monitoring and troubleshooting home network connectivity.
These tools help detect when your LAN or internet is down and automate waiting for your network to come online.

+----------------------------+
|   Official Distribution    |
+----------------------------+


The official archive contains only the following files: 

net_connectivity_tools_v1.zip

  license.txt
  net_internetout.bat
  net_lanup.bat
  net_routerup.bat
  net_wait.nat
  netico.ico
  netlist.bat
  readme.txt

There are no executables (.exe), installers, background services, or hidden components included.

If you download a version that contains additional files, modified scripts, or executables, it is not an official release.

Please download only from this GitHub repository:
https://github.com/jpnotes1/net_connectivity_tools/



+----------------------------+
|        TOOLS OVERVIEW      |
+----------------------------+

net_internetout.bat
  Full Home Internet Recovery Monitor: waits for router, shows assigned IP, checks internet connectivity,
  and displays ISP support numbers if internet is down.et

net_lanup.bat
  Quick LAN check: prints "LAN is up" or "LAN is down".

net_routerup.bat
  Router wait loop: waits until the router is reachable before proceeding.

net_wait.bat
  Internet wait loop: waits until internet is reachable and prints "Network is up".

netlist.bat
  lists all net tools in the folder.

+----------------------------+
|        REQUIREMENTS        |
+----------------------------+

- Windows 10 or 11
- PowerShell (default on modern Windows)
- Basic knowledge of running .bat files

+----------------------------+
|          USAGE             |
+----------------------------+

1. Download or place the .bat scripts in a folder.
2. Double-click the desired script or run from Command Prompt.

Examples:

Check LAN status quickly:
> net_lanup.bat

Wait until your router is online:
> net_routerup.bat

Wait until internet connectivity is restored:
> net_wait.bat

Full internet recovery monitor with ISP alert:
> net_internetout.bat

+----------------------------+
|           NOTES            |
+----------------------------+
- net_internetout.bat is the most comprehensive tool; the others can be used independently for quick checks or automation.
- Modify ISP numbers in net_internetout.bat to match your providers.
- Scripts are lightweight and do not require installation.



