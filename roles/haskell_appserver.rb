# haskell_appserver provides all of the core elements required
# to run a haskell application on the host.

#

name "haskell_appserver"
run_list "role[appserver]", "role[webserver]", "recipe[haskell::default]"
