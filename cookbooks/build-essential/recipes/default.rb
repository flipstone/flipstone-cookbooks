#
# Cookbook Name:: build-essential
# Recipe:: default
#
# Copyright 2008-2009, Opscode, Inc.
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
#

#
# sc: These are the versions that installed on AMI f0e20899
#
# [Wed, 05 Jan 2011 21:19:48 +0000] INFO: Starting Chef Run (Version 0.9.12)
# [Wed, 05 Jan 2011 21:19:49 +0000] INFO: Installing package[binutils-doc] version 2.20.1-3ubuntu7
# [Wed, 05 Jan 2011 21:19:53 +0000] INFO: Installing package[autoconf] version 2.65-3ubuntu1
# [Wed, 05 Jan 2011 21:19:59 +0000] INFO: Installing package[flex] version 2.5.35-9
# [Wed, 05 Jan 2011 21:20:03 +0000] INFO: Installing package[bison] version 1:2.4.1.dfsg-3
# [Wed, 05 Jan 2011 21:20:06 +0000] INFO: Installing package[git-core] version 1:1.7.0.4-1ubuntu0.2
# [Wed, 05 Jan 2011 21:20:15 +0000] INFO: Installing package[libreadline5-dev] version 5.2-7build1
# [Wed, 05 Jan 2011 21:20:22 +0000] INFO: Installing package[zlib1g-dev] version 1:1.2.3.3.dfsg-15ubuntu1
# [Wed, 05 Jan 2011 21:20:25 +0000] INFO: Installing package[libssl-dev] version 0.9.8k-7ubuntu8.5
# [Wed, 05 Jan 2011 21:20:35 +0000] INFO: Installing package[libxml2-dev] version 2.7.6.dfsg-1ubuntu1.1
# [Wed, 05 Jan 2011 21:20:39 +0000] INFO: Installing package[libxslt1-dev] version 1.1.26-1ubuntu1


case node[:platform]
when "ubuntu","debian"
  
  %w{build-essential binutils-doc}.each do |pkg|
    package pkg do
      action :install
    end
  end
when "centos"
  package "gcc" do
    action :install
  end
end

package "autoconf" do
  action :install
end

package "flex" do
  action :install
end

package "bison" do
  action :install
end
