#
# Only testing against ubuntu.  Feel free to extend and test.
#
# Cookbook Name:: docker
# Recipe:: default
# Author:: David Vollbracht
#
include_recipe 'apt'

apt_repository 'docker' do
  uri          'http://get.docker.io/ubuntu'
  distribution 'docker'
  components   ['main']
  key          'https://get.docker.io/gpg'
end

ruby_block "reboot_after_run" do
  block do
    node.run_state['reboot'] = true
  end
  action :nothing
end

package "linux-image-generic-lts-raring" do
  notifies :create, "ruby_block[reboot_after_run]", :immediately
end
package "linux-headers-generic-lts-raring"

package "lxc-docker" do
  version "1.2.0"
  action :install
end

