#
# Cookbook Name:: perlbrew
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
#
bash "perlbrew" do
  user node['user']['name']
  cwd node['user']['home']
  environment "HOME" => node['user']['home']

  code <<-EOC
    curl -kL http://install.perlbrew.pl | bash
  EOC

  not_if { File.exists?(node['user']['home'] + "/perl5/perlbrew/bin/perlbrew") } 
end

bash "perl" do
  home = node['user']['home']
  path = home + "/perl5/perlbrew/perls/perl-" + node['perl']['version'] + "/bin/perl"
  user node['user']['name']
  cwd home
  environment "HOME" => home

  code <<-EOC
    source ~/perl5/perlbrew/etc/bashrc
    perlbrew install #{node['perl']['version']}
    perlbrew switch #{node['perl']['version']}
    curl -L http://cpanmin.us | perl - App::cpanminus
  EOC

  not_if { File.exists?(path) }
end
