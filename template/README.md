Local setup (sc)
================
`sudo gem install chef`
`sudo gem install net-ssh-multi`
`sudo gem install fog`

`script/new_host.sh NODENAME`
`script/assign_ruby_roles.sh NODENAME`

** This is two scripts (vs one) as I have had to remote into the host and 
manually execute 'apt-get update' in order for the packages to install.  
I can't figure out yet how to get this command to run before anything else..! /angry

Configuration
=============

* .chef/knife.rb

The second config file, `.chef/knife.rb` is a repository specific configuration file for knife. If you're using the Opscode Platform, you can download one for your organization from the management console. If you're using the Open Source Chef Server, you can generate a new one with `knife configure`. For more information about configuring Knife, see the Knife documentation.

Next Steps
==========

Read the README file in each of the subdirectories for more information about what goes in those directories.
