name "webserver"
run_list "recipe[monit]", "recipe[nginx]"
