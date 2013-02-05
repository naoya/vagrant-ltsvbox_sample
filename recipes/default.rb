#
# Cookbook Name:: ltsvbox
# Recipe:: default
#
# Copyright (C) 2013 Naoya Ito
# 
#
service 'iptables' do
  action [:disable, :stop]
end

%w{git}.each do |pkg|
  package pkg do
    action :install
  end
end
