property :location, String, name_property: true
property :username, String

action :create do
  what_to_do = "git --git-dir " +  location + " stash"
  run_command(what_to_do)
end

def run_command(command)
  Chef::Log.logger.info("Going to run the command " + command)
  cmd = Mixlib::ShellOut.new(command, :user => username, :cwd => '/tmp', :env => nil)
  cmd.run_command
  #Chef::Log.logger.info("The response was " + cmd.stdout)
  cmd.stdout
end
