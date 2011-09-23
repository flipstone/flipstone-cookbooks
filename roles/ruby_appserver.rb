# ruby_appserver provides all of the core elements required
# to run a ruby application on the host.

#
# flipstone environment is rvm + bundler

name "ruby_appserver" 
run_list "recipe[ruby::rvm]", "recipe[ruby::bundler]", "recipe[ruby::rake]", "recipe[imagemagick::default]"
