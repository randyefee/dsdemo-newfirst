#!/bin/sh

sudo npm -g install bower
sudo npm -g install gulp
sudo npm -g install forever

cd ..
npm install
bower install
gulp build

cd /etc
sudo ln -s /space/projects/newfirst.live/etc/prod newfirst
cd /etc/init.d
sudo ln -s /space/projects/newfirst.live/etc/init.d/node-express-service newfirst
sudo chkconfig --add newfirst
sudo chkconfig --levels 2345 newfirst on
