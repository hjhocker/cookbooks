property :username, String
property :property, String
property :value, String

action :create do
  add_property(property,value)
  return
end

action :delete do
  remove_property(property)
end

def resolve_npm_path
  run_command("which npm")
end

def get_current_node_configuration
  run_command("npm config ls -l")
end

def add_property(property, value)
  run_command("npm config set " + property + " " + value)
end

def remove_property(property)
  run_command("npm config delete " + property)
end

def run_command(command)
  Chef::Log.logger.warn("Going to run the command " + command)
  cmd = Mixlib::ShellOut.new(command, :user => username, :cwd => '/tmp', :env => nil)
  cmd.run_command
  Chef::Log.logger.warn("The response was " + cmd.stdout)
  cmd.stdout
end
