#
# Cookbook Name:: ltsvbox
# Recipe:: growthforecast
#
# Copyright 2013, Naoya Ito
#
#
%w{cairo cairo-devel pango pango-devel libxml2-devel}.each do |pkg|
  package pkg do
    action :install
  end
end

package 'bitmap-console-fonts' do
  action :install
  only_if { node['platform'] == 'centos' }
end

cpanm 'GrowthForecast'

directory node['user']['home'] + "/growthforecast/" do
  owner node['user']['name']
  group node['user']['group']
  mode 0755
  action :create
end

template "growthforecast.run" do
  path node['user']['home'] + "/growthforecast/growthforecast.run"
  source "growthforecast.run.erb"
  owner node['user']['name']
  group node['user']['group']
  mode 0755
end
