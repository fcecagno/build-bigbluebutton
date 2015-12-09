#!/bin/bash

sudo service bbb-red5 stop
sudo pkill -u red5

set -xe

sudo chmod -R 777 /usr/share/red5/webapps

apps=( "bbb-video" "bbb-voice" "bigbluebutton-apps" "deskshare" )
#apps=( "deskshare" )
#apps=( "bigbluebutton-apps" )
for app in "${apps[@]}"; do
  cd ~/dev/bigbluebutton/$app
  gradle resolveDeps
  gradle clean war deploy
done

sudo chown -R red5:red5 /usr/share/red5/webapps/video/streams
