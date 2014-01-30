name "docker_host"
run_list "recipe[application::file_structure]",
         "recipe[timezone::eastern]",
         "recipe[docker]"
