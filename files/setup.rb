require 'socket'
require 'yaml'
require 'json'
require 'mustache'

ip = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}

template = File.open('/influxdb.conf.template', 'rb').read

config = {
  hostname: ip
}

rendered = Mustache.render(template, config)

File.open('/etc/influxdb/influxdb.conf', 'w') do |file|
  file.write(rendered)
end
