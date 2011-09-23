# How to configure this file
#
# * Copy your validator key file from
#   .chef to .chef/boostrap/validation.pem
#
# * Set the chef_server_url value below to
#   match the one in the opscode generated knife.rb file
#
# * Set the validation_client_name value below to
#   match the one in the opscode generated knife.rb file
#
# * Remove the raise line below
#
raise ".chef/bootstrap/client.rb needs to be configured"

log_level        :info
log_location     '/var/log/chef.log'
ssl_verify_mode :verify_none

pid_file               "/var/run/chef/chef-client.pid"

chef_server_url        '<Your chef server api url>'
validation_client_name '<Your chef validation client name>'
validation_key         "/etc/chef/validation.pem"
client_key             "/etc/chef/client.pem"
