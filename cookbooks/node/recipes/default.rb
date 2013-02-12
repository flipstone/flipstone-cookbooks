# Installing nodejs
#
# Chris Lea maintains Ubuntu PPA for Node:
#   https://launchpad.net/~chris-lea/+archive/node.js
#
# sudo add-apt-repository ppa:chris-lea/node.js
#
# Note, add-apt-repository is linking to a Personal Package Archive
#  https://help.launchpad.net/Packaging/PPA


package 'python-software-properties'

execute "add-apt-respository (node)" do
  command "add-apt-repository ppa:chris-lea/node.js"
  action :run
end
execute "apt-get update" do
  command "apt-get update -o Acquire::http::No-Cache=True"
  action :run
end

package "nodejs" do
  version "0.8.8-1chl1~lucid1"
  action :install
end
package "npm" do
  version "1.1.59-1chl1~lucid1"
  action :install
end