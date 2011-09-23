mail = data_bag_item("mail_settings", "main")

node.set[:alert_email] = mail['alert_email'] || raise("You need to set mail_settings.main.alert_email in your data bags")
node.set[:mailserver] = mail['mailserver'] || raise("You need to set mail_settings.main.mailserver in your data bags")

package "monit" do
  action :install
end

template "/etc/monit/monitrc" do
  owner "root"
  group "root"
  mode 0700
  source 'monitrc.erb'
end

directory "/var/monit" do
  owner "root"
  group "root"
  mode  0700
end

execute "stop-monit" do
  command "pkill -9 monit"
  returns [0,1]
  action :nothing
end

execute "start-monit" do
  command "monit"
  action :nothing
end

execute "restart-monit" do
  command "pkill -9 monit"
  returns [0,1]
  notifies :run, resources(:execute => "start-monit")
  action :nothing
end
