name "mongoserver"
run_list 'role[host]', "recipe[monit]", "recipe[mongodb]"
