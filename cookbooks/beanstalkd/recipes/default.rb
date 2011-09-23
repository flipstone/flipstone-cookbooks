#
# Builds beanstalkd from source, configures it as an upstart job.
#

include_recipe "build-essential"

# dependencies for beanstalkd
package "libevent-dev" do
  action :install
end

name = "beanstalkd"
beanstalkd_version = node[:beanstalkd][:version]
gzip_file = "beanstalkd-#{beanstalkd_version}.tar.gz"

remote_file "/tmp/#{gzip_file}" do
  source "http://xph.us/dist/beanstalkd/#{gzip_file}"
  action :create_if_missing
end

bash "compile_beanstalkd_source" do
  cwd "/tmp"
  code <<-EOH
    tar zxf #{gzip_file}
    cd beanstalkd-#{beanstalkd_version} && ./configure
    make && make install
  EOH
  creates node[:beanstalkd][:binary]
end

template "beanstalkd.conf" do
  path node[:beanstalkd][:upstart_config]
  source "beanstalkd.conf.erb"
  owner "root"
  group "root"
  mode 0644
end

monitrc "beanstalkd", :app_name => 'all'

link "/etc/init.d/beanstalkd" do
  to "/lib/init/upstart-job"
end

directory node[:beanstalkd][:log_dir] do
  mode 0755
  owner "root"
  action :create
end

service "beanstalkd" do
  action [:start]
end
