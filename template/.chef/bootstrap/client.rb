# Fill in the values below
# also copy your .chef/<validatior name>.pem file to .chef/bootstrap/validation.pem
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
