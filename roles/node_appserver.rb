# node_appserver provides all of the core elements required
# to run a node application on the host.

name "node_appserver"
run_list "role[appserver]", "role[webserver]", "recipe[node::default]"
