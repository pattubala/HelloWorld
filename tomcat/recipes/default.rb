#
# Cookbook:: Install-Tomcat
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

directory 'delete tomcat' do
  path "#{node["tomcat_home"]}"
  action :delete
  recursive true
  ignore_failure true
end

remote_file "#{node["tomcat_download_dir"]}" do
  source "#{node["tomcat_download_url"]}"
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute 'extract tomcat' do
  command " tar -xvzf #{node["tomcat_download_dir"]} -C #{node["tomcat_extracr_dir"]}"
end

file "#{node["tomcat_download_dir"]}" do
  action :delete
end

execute 'start tomcat' do
  command "sh #{node["tomcat_home"]}/bin/startup.sh"
end
