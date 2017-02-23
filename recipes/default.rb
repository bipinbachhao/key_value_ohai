#
# Cookbook Name:: key_value_ohai
# Recipe:: default
#
# Author : Bipin Bachhao
# Email-id : bipinbachhao@gmail.com
#
# Apache 2.0 license
#
#

file_path = "#{node['key_value_ohai']['file_path']}"
file_name = "#{node['key_value_ohai']['file_name']}"

directory '/etc/chef/ohai/plugins/' do
  owner 'root'
  group 'root'
  mode 00755
  recursive true
  action :create
end

cookbook_file "#{file_path}/#{file_name}" do
  source file_name
  owner 'root'
  group 'root'
  mode 00644
end

template '/etc/chef/ohai/plugins/keyvalueohai.rb' do
  source 'keyvalueohai.erb'
  owner 'root'
  group 'root'
  mode 00744
  variables(
    file_path: file_path,
    file_name: file_name
  )
end
