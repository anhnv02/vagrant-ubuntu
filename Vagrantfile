# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

confDir = $confDir ||= File.expand_path(File.dirname(__FILE__))

homesteadYamlPath = confDir + "/Homestead.yaml"
if File.exist? homesteadYamlPath then
    settings = YAML::load(File.read(homesteadYamlPath))
else
    abort "Homestead settings file not found in #{confDir}"
end

require File.expand_path(File.dirname(__FILE__) + '/scripts/homestead.rb')

Vagrant.configure(2) do |config|

    # Configure and Settings
    Homestead.configure(config, settings)

    # Create Database
    settings["databases"].each do |db|
        config.vm.provision "shell" do |s|
            s.name = "Creating Database: " + db
            s.path = confDir + "/scripts/databases/create-db.sh"
            s.args = [db]
        end
    end
end