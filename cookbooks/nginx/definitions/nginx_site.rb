#
# Cookbook Name:: nginx
# Definition:: nginx_site
# Author:: AJ Christensen <aj@junglist.gen.nz>
#
# Extended to include support for default selection
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

define :nginx_site, :enable => true do
  enabled_as = params[:enabled_as] ? params[:enabled_as] : params[:name]

  enabled_as_path = "#{node[:nginx][:dir]}/sites-enabled/#{enabled_as}"
  available_as_path = "#{node[:nginx][:dir]}/sites-available/#{params[:name]}"
  is_enabled_as_link = File.symlink?(enabled_as_path)
  
  if params[:enable]
    # remove the symlink if this app is pointing elsewhere
    if (is_enabled_as_link && (File.readlink(enabled_as_path) != available_as_path))
      Chef::Log.warn("Unlinking application #{params[:enabled_as]} from #{File.readlink(enabled_as_path)}") if is_enabled_as_link
      File.delete(enabled_as_path)
    end
    
    Chef::Log.info("Enabling nginx site #{params[:enabled_as]} => #{params[:name]}") unless File.symlink?(enabled_as_path)
    
    execute "nxensite #{params[:name]} #{enabled_as}" do
      command "/usr/sbin/nxensite #{params[:name]} #{enabled_as}"
      notifies :reload, resources(:service => "nginx")
      not_if do File.symlink?(enabled_as_path) end
    end

  else
    Chef::Log.info("Disabling nginx site #{params[:name]}") if is_enabled_as_link
    execute "nxdissite #{params[:name]}" do
      command "/usr/sbin/nxdissite #{params[:name]}"
      notifies :reload, resources(:service => "nginx")
      only_if do is_enabled_as_link end
    end
  end

end
