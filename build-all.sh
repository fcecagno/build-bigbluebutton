#!/bin/bash

set -xe

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $DIR

sudo bbb-conf --stop

./build-config.sh
./build-akka.sh
./build-apps.sh
./build-demo.sh
# ./build-applet.sh
./build-client.sh
./build-web.sh
./build-html5.sh
cd ~/dev/bigbluebutton/record-and-playback/
./deploy.sh

sudo bbb-conf --enablewebrtc
sudo bbb-conf --clean
