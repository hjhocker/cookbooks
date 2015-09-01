# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

ssl_verify_mode :verify_none

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "harrisonhocker"
client_key               "#{current_dir}/harrisonhocker.pem"
validation_client_name   "motobecane-validator"
validation_key           "#{current_dir}/motobecane-validator.pem"
chef_server_url          "https://vultr.guest/organizations/motobecane"
cookbook_path            ["#{current_dir}/cookbooks"]
