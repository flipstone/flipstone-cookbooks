default[:beanstalkd][:version]      = "1.4.6"
default[:beanstalkd][:src_binary]   = "#{beanstalkd[:install_path]}/sbin/beanstalkd"

set[:beanstalkd][:log_dir] = "/var/log/beanstalkd"
set[:beanstalkd][:binary]  = "/usr/local/bin/beanstalkd"
set[:beanstalkd][:initd_binary] = "/etc/init.d/beanstalkd"
set[:beanstalkd][:upstart_config] = "/etc/init/beanstalkd.conf"

set[:beanstalkd][:port] = 11300
set[:beanstalkd][:user] = "root"
