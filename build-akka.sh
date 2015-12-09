#!/bin/bash -xe

cd ~/dev/bigbluebutton/bbb-common-message
sbt clean
sbt compile
sbt publish
sbt publishLocal

cd ~/dev/bigbluebutton/akka-bbb-apps
sbt clean
sbt debian:packageBin
sudo dpkg -i target/*.deb

cd ~/dev/bigbluebutton/akka-bbb-fsesl
sbt clean
sbt debian:packageBin
sudo dpkg -i target/*.deb

