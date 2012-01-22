#
# Author:: Flipstone <development@flipstone.com>
# Cookbook Name:: wkhtmltopdf
# Recipe:: default
#
# Copyright 2009-2010, Flipstone Technology Partners, Inc
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


%w(openssl build-essential xorg libssl-dev).each { |p| package p }

bash "download and install wkhtmltopdf" do
  user "root"
  cwd "/tmp"

  code <<-end_code
    wget http://wkhtmltopdf.googlecode.com/files/wkhtmltopdf-0.9.9-static-i386.tar.bz2
    tar xfj wkhtmltopdf-0.9.9-static-i386.tar.bz2
    cp wkhtmltopdf-i386 /usr/local/bin/wkhtmltopdf
    chmod +x /usr/local/bin/wkhtmltopdf
  end_code

  not_if { File.executable?("/usr/local/bin/wkhtmltopdf") }
end

