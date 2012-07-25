#
# Builds mongodb from source, configures it as an upstart job.
#

include_recipe "build-essential"
include_recipe "aws"

aws = data_bag_item("aws", "main")

old_aws_info = node[:aws]

aws_ebs_volume "big-space-volume" do
  aws_access_key aws['aws_access_key_id']
  aws_secret_access_key aws['aws_secret_access_key']
  device node[:big_space][:volume_device]
  volume_id node[:big_space][:volume_id]
  action [ :attach ]
end

# on natty narwhal devices come up as /dev/xvdi.
# Universal support would need to check for each device name.
linux_device = node[:big_space][:linux_device] ||
               node[:big_space][:volume_device].sub('/dev/s','/dev/xv')

if old_aws_info.nil? ||
   old_aws_info['ebs_volume'].nil? ||
   old_aws_info['ebs_volume']['big-space-volume'].nil?

  execute "format big-space-volume" do
    command "mkfs.ext4 -F #{linux_device}"
  end
end


directory node[:big_space][:mount_point] do
  mode 0777
  owner "root"
  action :create
  recursive true
end

mount node[:big_space][:mount_point] do
  device linux_device
  fstype "ext4"
  action [:mount, :enable]
  options ['defaults','auto']
end

