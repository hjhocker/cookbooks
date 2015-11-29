property :username, String
property :groupname, String

action :create do
  Chef::Log.logger.warn('why are you here?')
  cmd = Mixlib::ShellOut.new("ls ~", :user => 'harrison', :cwd => '/home', :env => nil)
  cmd.run_command
  cmd.stdout.split(" ").each do |thing|
    Chef::Log.logger.warn("content of home directory: " + thing)
  end
  stuff = test("hahahaha")
  Chef::Log.logger.warn("say hello chef " + stuff)
  # Chef::Log.logger.warn(cmd.stdout)
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

def test(stuff)
  Chef::Log.logger.warn("test ------ " + stuff)
  "fffffffffffffffffffffffUUUUUUUUUUUUUUUUUUUUUUU"
end
