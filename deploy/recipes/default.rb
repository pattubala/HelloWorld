#
# Cookbook:: tomcat-deploy
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

remote_file 'Download war file' do
  source "http://#{node["nexus_url"]}/repository/nexus01/maven-org/mybatis/maven-jpetstore/maven-6.0.2-SNAPSHOT/maven-jpetstore-maven-6.0.2-20200524.083734-1.war"
  path "#{node["download_war_path"]}/maven-jpetstore-maven-6.0.2-20200524.083734-1.war"
end

execute 'deploy to tomcat' do
  command "mv #{node["download_war_path"]}/maven-jpetstore-maven-6.0.2-20200524.083734-1.war #{node["tomcat_directory"]}/webapps/jpetstore.war"
end

execute 'start tomcat' do
  command "sh #{node["tomcat_directory"]}/bin/startup.sh"
end
