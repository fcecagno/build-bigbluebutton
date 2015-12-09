#!/bin/bash

set -xe

# sudo service tomcat7 stop

cd ~/dev/bigbluebutton/bbb-api-demo
cp /var/lib/tomcat7/webapps/demo/bbb_api_conf.jsp src/main/webapp/
sudo rm -rf /var/lib/tomcat7/webapps/demo*
rm -rf build/
gradle clean resolveDeps war
sudo cp build/libs/demo.war /var/lib/tomcat7/webapps/demo.war

# sudo service tomcat7 start

