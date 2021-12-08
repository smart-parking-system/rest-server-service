#!/bin/bash -e

VERSION="v0.1.0"

if [[ "`id -u`" != "0" ]]; then
  echo "Please run as root"
  exit 1
fi

chmod 755 sps-rest-server
cp sps-rest-server /etc/init.d/sps-rest-server

if [[ -d "/etc/rc.d" ]]; then
  ln -s /etc/init.d/sps-rest-server /etc/rc.d/S99sps-rest-server
else
  ln -s /etc/init.d/sps-rest-server /etc/rc3.d/S99sps-rest-server
fi

mkdir -p /sps
cd /sps
wget https://github.com/smart-parking-system/rest-server/releases/download/$VERSION/sps-rest-server.jar

echo -e "SPS Rest Server is Installed\nTo run: /etc/init.d/sps-rest-server start"

