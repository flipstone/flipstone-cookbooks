name "queueserver"
run_list "recipe[monit]", "recipe[beanstalkd]"
