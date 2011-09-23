# Fill in the values below
# generate rsa keys for client and validatior
#
raise ".chef/knife.rb needs to be configured"

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "<your node name>"
client_key               "#{current_dir}/<your client key file name>"
validation_client_name   "<your validator client name>"
validation_key           "#{current_dir}/<your validator key file name>"
chef_server_url          "<your chef server api url>"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]

knife[:aws_access_key_id]     = "<Your AWS access key id>"
knife[:aws_secret_access_key] = "<Your AWS secret access key>"

