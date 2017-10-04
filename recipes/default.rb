#
# Cookbook:: passenger
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# https://www.phusionpassenger.com/library/install/standalone/install/oss/jessie/

# Install dependencies
package 'apt-transport-https'

# Install Passenger repository
apt_repository 'passenger' do
  uri 'https://oss-binaries.phusionpassenger.com/apt/passenger'
  distribution node['lsb']['codename']
  components ['main']
  keyserver 'hkp://keyserver.ubuntu.com:80'
  key '561F9B9CAC40B2F7'
end

# Install Passenger
package 'passenger'

# Validate installation
execute 'passenger_validate' do
  command '/usr/bin/passenger-config validate-install --auto'
end
