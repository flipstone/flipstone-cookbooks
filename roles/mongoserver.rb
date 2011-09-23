name "mongoserver" 
run_list "recipe[monit]", "recipe[mongodb]"
