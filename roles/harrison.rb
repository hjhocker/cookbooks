name "person"
description "me"
run_list "recipe[make_folders]", "recipe[git]"
default_attributes ({"home" => "/home/harrison", "foldername" => "test_harry", "folderpath" => "/tmp", "fullname" => "Harrison Hocker", "email" => "hjhocker@gmail.com", "username" => "harrison"})
