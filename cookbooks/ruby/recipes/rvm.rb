#
# Cookbook Name:: ruby
# Recipe:: rvm
#
# Copyright 2010, Matthias Marschall
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
 
# see: http://li109-47.members.linode.com/blog/
package "curl"
package "git-core"

%w(libreadline5-dev zlib1g-dev libssl-dev libxml2-dev libxslt1-dev).each do |pkg|
  package pkg
end
 
bash "install RVM" do
  user "root"
  code "bash <( curl -L https://raw.github.com/wayneeseguin/rvm/1.2.0/contrib/install-system-wide ) --version 1.2.0"
  not_if "which rvm"
end

cookbook_file "/etc/profile.d/rvm.sh" do
  source "rvm.sh"
  mode "0655"
end
 
bash "install 1.9.2 in RVM" do
  user "root"
  code "rvm install 1.9.2"
  not_if "rvm list | grep 1.9.2"
end

bash "make 1.9.2 the default ruby" do
  user "root"
  code "rvm --default 1.9.2"
  not_if "rvm exec ruby --version | grep 1.9.2"
end
