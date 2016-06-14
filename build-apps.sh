#!/bin/bash

sudo service bbb-red5 stop
sudo pkill -u red5

set -xe

sudo chmod -R 777 /usr/share/red5/webapps

cd ~/dev/bigbluebutton/esl-client-bbb
gradle resolveDeps
cd ~/dev/bigbluebutton/esl-client-bbb/org.freeswitch.esl.client
gradle resolveDeps
gradle clean jar

apps=( "bbb-video" "bbb-voice" "bigbluebutton-apps" "deskshare" )
for app in "${apps[@]}"; do
  cd ~/dev/bigbluebutton/$app
  gradle resolveDeps
  gradle clean war deploy
done

sudo chown -R red5:red5 /usr/share/red5/webapps/video/streams
