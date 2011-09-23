# ruby_appserver provides all of the core elements required
# to run a ruby application on the host.

#
# flipstone environment is rvm + bundler

name "rails_server"
run_list "role[capistrano_target]",
         "recipe[ruby::rvm]",
         "recipe[ruby::bundler]",
         "recipe[ruby::rake]",
         "recipe[monit]",
         'role[webserver]'
