#!/bin/bash

if [ -z $1]
    echo "Usage: assign_cruise_roles.sh CLIENT_NAME"
    exit
fi

knife node run_list add $1 "role[appserver]" -a "role[host]"
knife node run_list add $1 "role[ruby_appserver]" -a "role[appserver]"
knife node run_list add $1 "role[webserver]" -a "role[ruby_appserver]"
knife node run_list add $1 "role[siege]" -a "role[webserver]"
