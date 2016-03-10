#!/bin/bash

set -xe

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $DIR

source hostname.sh

cd ~/dev/bigbluebutton/bigbluebutton-client
cp resources/config.xml.template src/conf/config.xml
sed -i "s:HOST:$HOST:g" src/conf/config.xml
sudo service tomcat7 restart

ant localize -DLOCALE=en_US
ant localize -DLOCALE=pt_BR
ant

