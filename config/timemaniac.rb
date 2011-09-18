require 'rubygems'
require 'yaml'

ActiveRecord::Base.establish_connection(YAML.load_file("config/database.yml"))
