name "person"
description "me"
run_list "recipe[make_folders]", "recipe[git]", "recipe[java]", "recipe[shells]", "recipe[utilities]"
default_attributes ({"test" => "Dir.home", "home" => "/home/harrison", "foldername" => "test_harry", "folderpath" => "/tmp", "fullname" => "Harrison Hocker", "email" => "hjhocker@gmail.com", "username" => "harrison"})
