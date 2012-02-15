default[:mongod][:version]      = "2.0.0"

default[:mongod][:log_dir] = "/var/log/mongod"
default[:mongod][:logpath] = "/var/log/mongod/mongo.out"
default[:mongod][:data_dir] = "/data/db"
default[:mongod][:binary]  = "opt/mongo/bin/mongod"
default[:mongod][:initd_binary] = "/etc/init.d/mongod"
default[:mongod][:upstart_config] = "/etc/init/mongod.conf"
default[:mongod][:persistent] = false
default[:mongod][:volume_size] = 50
default[:mongod][:volume_device] = '/dev/sdi'
default[:mongod][:repl_set] = 'mongo-replset'

default[:mongod][:port] = 27017
default[:mongod][:user] = "root"
