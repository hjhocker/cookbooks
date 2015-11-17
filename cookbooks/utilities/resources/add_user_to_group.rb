property :username, String
property :groupname, String

action :create do
  # Chef::Log:info('why are you here?')
  group "#{groupname}" do
    action :create
    members "#{username}"
    append true
  end

end

action :remove do

  group "#{groupname}" do
    action :remove
    members "#{username}"
  end

end
