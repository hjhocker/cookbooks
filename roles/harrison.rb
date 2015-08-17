name "person"
description "me"
run_list "recipe[make_folders]"
default_attributes ({"foldername" => "test_harry", "folderpath" => "/tmp", "fullname" => "Harrison Hocker", "email" => "hjhocker@gmail.com", "username" => "harrison"})
