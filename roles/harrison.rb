name "person"
description "me"
run_list "recipe[make_folders]", "recipe[git]", "recipe[java]", "recipe[shells]", "recipe[utilities]", "recipe[vim]", "recipe[nginx]"
default_attributes ({"home" => "/home/harrison", "foldername" => "test_harry", "folderpath" => "/tmp", "fullname" => "Harrison Hocker", "email" => "hjhocker@gmail.com", "user" => "harrison", "username" => "harrison"})
