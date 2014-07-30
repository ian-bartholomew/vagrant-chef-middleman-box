name "ruby-development"
description "setup for ruby core development"
run_list(
  "recipe[yum::epel]",
  "recipe[preinstall]",
  "recipe[git]",  
  "recipe[ruby_build]",
  "recipe[rbenv::system]",
  "recipe[rbenv::vagrant]",  
  "recipe[apache2]",
  "recipe[postinstall]"
)
