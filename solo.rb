home = Dir.home

cookbook_path [ "#{home}/.chef/cookbooks", "#{home}/.berkshelf/cookbooks" ]
json_attribs "#{home}/.chef/attributes.json"
