#
# Builds mongodb from source, configures it as an upstart job.
#

include_recipe "build-essential"
include_recipe "monit"
include_recipe "aws"

aws = data_bag_item("aws", "main")

# dependencies for mongo
SERIES1 = ["tcsh", "git-core", "scons", "g++"]
SERIES2 = ["libpcre++-dev", "libboost-dev", "libreadline-dev", "xulrunner-1.9.2-dev"]
SERIES3 = ["libboost-program-options-dev", "libboost-thread-dev", "libboost-filesystem-dev", "libboost-date-time-dev"]

[SERIES1, SERIES2, SERIES3].each do |series| 
  series.each do |pkg|
    package pkg do
      action :install
    end
  end
end

bash "compile_mongo_source" do
  cwd "/tmp"
  code <<-EOH
    echo "Cloning from git"
    git clone git://github.com/mongodb/mongo.git
    cd mongo
    echo "Checking out target revision #{node[:mongod][:version]}"
    git checkout r#{node[:mongod][:version]}
    echo "Scons'ing project"
    scons all
    echo "scons install"
    scons --prefix=/opt/mongo install
  EOH
  creates node[:mongod][:binary]
end

template "mongod.conf" do
  path node[:mongod][:upstart_config]
  source "mongod.conf.erb"
  owner "root"
  group "root"
  mode 0644
end

directory node[:mongod][:data_dir] do
  mode 0755
  owner "root"
  action :create
  recursive true
end

directory node[:mongod][:log_dir] do
  mode 0755
  owner "root"
  action :create
  recursive true
end

link "/etc/init.d/mongod" do
  to "/lib/init/upstart-job"
end

if node[:mongod][:persistent]
  old_aws_info = node[:aws]

  aws_ebs_volume "mongod-data-volume" do
    aws_access_key aws['aws_access_key_id']
    aws_secret_access_key aws['aws_secret_access_key']
    size node[:mongod][:volume_size]
    device node[:mongod][:volume_device]
    action [ :create, :attach ]
  end

  if old_aws_info.nil? ||
     old_aws_info['ebs_volume'].nil? ||
     old_aws_info['ebs_volume']['mongod-data-volume'].nil?

    execute "format mongo-data-value" do
      command "mkfs.ext3 -F #{node[:mongod][:volume_device]}"
    end
  end

  mount node[:mongod][:data_dir] do
    device node[:mongod][:volume_device]
    fstype "ext3"
    action :mount
    notifies :restart, 'service[mongod]'
  end
end

service "mongod" do
  action [:start]
end

monitrc "mongod", :app_name => 'all'
