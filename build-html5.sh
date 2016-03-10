#!/bin/bash

set -xe

sudo chown -R $USER:$USER /usr/share/meteor
rm -rf /usr/share/meteor/html5/*
cp -r ~/dev/bigbluebutton/bigbluebutton-html5/* /usr/share/meteor/html5/
sudo chown -R meteor:meteor /usr/share/meteor
