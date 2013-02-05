require 'berkshelf/vagrant'

Vagrant::Config.run do |config|
  config.vm.host_name = "ltsvbox"

  config.vm.box = "base"
  config.vm.network :hostonly, "192.168.50.6"

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :user => {
        :name => 'vagrant',
        :home => '/home/vagrant'
      },
      :perl => {
        :version => '5.17.8'
      }
    }

    chef.run_list = [
      "recipe[yum::epel]",
      "recipe[ltsvbox::default]",
      "recipe[ltsvbox::nginx]",
      "recipe[ltsvbox::td-agent]",
      "recipe[ltsvbox::perlbrew]",
      "recipe[ltsvbox::growthforecast]",
      "recipe[ltsvbox::supervisord]"
    ]
  end
end
