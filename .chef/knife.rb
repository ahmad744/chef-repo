# See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "ahmad744"
client_key               "#{current_dir}/ahmad744.pem"
validation_client_name   "app-dev-validator"
validation_key           "#{current_dir}/app-dev-validator.pem"
chef_server_url          "https://api.chef.io/organizations/app-dev"
cookbook_path            ["#{current_dir}/../cookbooks"]
