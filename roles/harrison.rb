name "person"
description "me"
run_list "recipe[make_folders]", "recipe[git]", "recipe[java]", "recipe[shells]", "recipe[utilities]", "recipe[docker_configuration]"
default_attributes ({"home" => "/home/harrison", "foldername" => "test_harry", "folderpath" => "/tmp", "fullname" => "Harrison Hocker", "email" => "hjhocker@gmail.com", "username" => "harrison"})
