#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $DIR

set -xe

cp ../dev/bigbluebutton/bigbluebutton-client/resources/config.xml.template config.xml.erb
sed -i 's|\(branding.*logo\)="\([^"]*\)"|\1="<%= @logo %>"|g' config.xml.erb
sed -i 's|\(branding.*copyright\)="\([^"]*\)"|\1="<%= @copyright_message %>"|g' config.xml.erb
sed -i 's|\(branding.*background\)="\([^"]*\)"|\1="<%= @background %>"|g' config.xml.erb
sed -i 's|\(branding.*toolbarColor\)="\([^"]*\)"|\1="<%= @toolbarColor %>"|g' config.xml.erb
sed -i 's|\(branding.*toolbarColorAlphas\)="\([^"]*\)"|\1="<%= @toolbarColorAlphas %>"|g' config.xml.erb
sed -i 's|\(layout.*defaultLayout\)="\([^"]*\)"|\1="<%= @default_layout %>"|g' config.xml.erb
sed -i 's|\(showRecordingNotification\)="\([^"]*\)"|\1="<%= @show_recording_notification %>"|g' config.xml.erb
sed -i 's|http://HOST|<%= @server_url %>|g' config.xml.erb
sed -i 's|HOST|<%= @server_domain %>|g' config.xml.erb
sed -i 's|CHROME_VERSION|<%= @chrome_version %>|g' config.xml.erb
sed -i 's|FIREFOX_VERSION|<%= @firefox_version %>|g' config.xml.erb
sed -i 's|FLASH_VERSION|<%= @flash_version %>|g' config.xml.erb
sed -i 's|VERSION|<%= @module_version %>|g' config.xml.erb
