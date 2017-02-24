#!/bin/bash

. /etc/profile.d/rbenv.sh
ruby /setup.rb

exec influxd run -config /etc/influxdb/influxdb.conf 
