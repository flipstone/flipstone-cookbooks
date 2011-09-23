if platform?("ubuntu","redhat","fedora")
  link "/etc/localtime" do
    to "/usr/share/zoneinfo/America/New_York"
  end
end

template "/etc/hosts" do
  path "/etc/hosts"
  source "hosts.erb"
  owner "root"
  group "root"
  mode 0644
end

execute "reset-nodename" do
  command "hostname #{node.name}"
end

