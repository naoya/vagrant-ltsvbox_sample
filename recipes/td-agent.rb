#
# Cookbook Name:: ltsvbox
# Recipe:: td-agent
#
# Copyright 2013, Naoya Ito
#
#
yum_repository "treasure-data" do
  url "http://packages.treasure-data.com/redhat/$basearch"
  action :add
end

package "td-agent" do
  action :upgrade
end

%w{growthforecast datacounter}.each do |plugin|
  gem_package "fluent-plugin-#{plugin}" do
    gem_binary "/usr/lib64/fluent/ruby/bin/fluent-gem"
    action :install
  end
end

## install fluent-plugin-tail-labeled-tsv via github
git "/etc/td-agent/plugin/fluent-plugin-tail-labeled-tsv" do
  repository "git://github.com/stanaka/fluent-plugin-tail-labeled-tsv.git"
  # reference "master"
  action :checkout
end

link "/etc/td-agent/plugin/in_tail_labeled_tsv.rb" do
  to "/etc/td-agent/plugin/fluent-plugin-tail-labeled-tsv/lib/fluent/plugin/in_tail_labeled_tsv.rb"
end

service "td-agent" do
  supports :restart => true, :reload => true
  action [ :enable, :start ]
end

template "td-agent.conf" do
  path "/etc/td-agent/td-agent.conf"
  source "td-agent.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :reload, 'service[td-agent]'
end
