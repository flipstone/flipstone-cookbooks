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

package "lxc-docker" do
  version "0.7.6"
  action :install
end
