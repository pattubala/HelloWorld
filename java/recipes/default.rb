#
# Cookbook:: Install_Java
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

execute "apt-get-update" do
  command "apt-get update"
  ignore_failure true
end

apt_package 'unzip' do
  action :install
end

apt_package "#{node["Java_package"]}"


