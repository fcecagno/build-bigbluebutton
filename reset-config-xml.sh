#!/bin/bash

set -xa

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $DIR

source hostname.sh

cd ~/dev/bigbluebutton/bigbluebutton-client
cp resources/config.xml.template src/conf/config.xml
sed -i "s:HOST:$HOST:g" src/conf/config.xml
ant init-ant-contrib copy-resource-files
sudo service tomcat7 restart
