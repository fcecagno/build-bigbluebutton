#!/bin/bash

set -xe

sudo rm -rf /var/www/bigbluebutton-default/
sudo cp -r ~/dev/bigbluebutton/bigbluebutton-config/web/ /var/www/bigbluebutton-default
sudo cp ~/dev/bigbluebutton/bigbluebutton-config/bin/* /usr/local/bin/
