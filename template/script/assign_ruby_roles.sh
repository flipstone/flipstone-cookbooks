#!/bin/bash

knife node run_list add $1 "role[appserver]" -a "role[host]"
knife node run_list add $1 "role[ruby_appserver]" -a "role[appserver]"
knife node run_list add $1 "role[webserver]" -a "role[ruby_appserver]"
knife node run_list add $1 "role[queueserver]" -a "role[webserver]"