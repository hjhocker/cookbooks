node.default['home'] = Dir.home
node.default['user'] = Dir.home.split("/")[Dir.home.split("/").size-1]
