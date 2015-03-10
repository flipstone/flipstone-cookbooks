name "appserver"
run_list "recipe[application::file_structure]",
         "recipe[git]",
         "recipe[timezone::eastern]"
