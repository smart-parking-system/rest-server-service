#!/bin/bash -e

VERSION="v0.2.0"

if [[ "`id -u`" != "0" ]]; then
  echo "Please run as root"
  exit 1
fi

install() {
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

  echo -e "SPS Rest Server is installed succesfully\nTo run: /etc/init.d/sps-rest-server start"
}

uninstall() {
  rm -rf /etc/rc.d/S99sps-rest-server /etc/rc3.d/S99sps-rest-server /etc/init.d/sps-rest-server /sps
  echo "SPS Rest Server is uninstalled succesfully"
}

if [[ "$1" == "uninstall" ]]; then
  uninstall
else
  install
fi

