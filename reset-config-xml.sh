#!/bin/bash

set -xa

source hostname.sh

cd ~/dev/bigbluebutton/bigbluebutton-client
cp resources/config.xml.template src/conf/config.xml
sed -i "s:HOST:$HOST:g" src/conf/config.xml
ant init-ant-contrib copy-resource-files
sudo service tomcat7 restart
