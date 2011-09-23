#
# Only testing against ubuntu.  Feel free to extend and test.
#
# Cookbook Name:: siege
# Recipe:: default
# Author:: Scott Conley
#

package "siege" do
  version "2.68-1build1"
  action :install
end
