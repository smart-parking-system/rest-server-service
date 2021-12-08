# SPS Rest Server Service
Script to install [rest-server](https://github.com/smart-parking-system/rest-server) & setup an `init.d` service on a linux machine

## Usage
`./install.sh [uninstall]`  
If `uninstall` is passed, the script will delete the `rest-server` & `init.d` scripts, otherwise it installs the `rest-server` & created `init.d` & `rc.d` scripts.  
After the installation, there will be a `sps-rest-server` `init.d` script. It is user to control the `rest-server`.  
Usage: `/etc/init.d/sps-rest-server {start|stop|restart|status}`

## How To Install
Prerequisites:
 - `postgresql` with deployed sps database (Instructions on how to deploy can be found [here](https://github.com/smart-parking-system/db))
 - `java` at least version 11 (tesed with 15 & 16)

Steps:
 - Clone the repo
 - Run `./install.sh`
