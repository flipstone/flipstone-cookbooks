name "capistrano_target"
run_list "role[host]",
         "recipe[application::file_structure]",
         "recipe[git]",
         "recipe[timezone::eastern]"
