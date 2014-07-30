#
# Cookbook Name:: postinstall
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

group "rbenv" do
  action :create
  members "vagrant"
  gid 1100
  append true
end

bash "chgrp and chmod" do
  user "root"
  cwd "/usr/local"
  code <<-EOH
    chgrp -R rbenv rbenv
    chmod -R g+rwxX rbenv
  EOH
end

#
# Load firewall rules we know works
#
template "/etc/sysconfig/iptables" do
  # path "/etc/sysconfig/iptables"
  source "iptables.erb"
  owner "root"
  group "root"
  mode 00600
  # notifies :restart, resources(:service => "iptables")
end

execute "service iptables restart" do
  user "root"
  command "service iptables restart"
end