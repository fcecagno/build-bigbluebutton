#!/bin/bash

set -xe

sudo service tomcat7 stop

sudo chmod 666 /var/log/bigbluebutton/bbb-web.log
cd ~/dev/bigbluebutton/bigbluebutton-web
sudo rm -rf /var/lib/tomcat7/webapps/bigbluebutton*
rm -rf target/
gradle clean resolveDeps
grails clean
grails war
VERSION=0.9.0
sudo cp target/bigbluebutton-$VERSION.war /var/lib/tomcat7/webapps/bigbluebutton.war

sudo service tomcat7 start

