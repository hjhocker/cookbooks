property :username, String
property :property, String
property :value, String

load_current_value do
  value get_value_from_configuration(property)
end

action :create do
  converge_if_changed :value do
    add_property(property,value)
  end
  Chef::Log.logger.warn("The node value for " + property + " is " + value)
end

action :delete do
  remove_property(property)
end

def resolve_npm_path
  run_command("which npm")
end

def get_property_from_configuration(prop)
  get_current_node_configuration()
end

def get_value_from_configuration(prop)
  get_current_node_configuration()
  'value2'
end

def get_current_node_configuration()
  run_command("npm config ls -l")
end

def add_property(property, value)
  run_command("npm config set " + property + " " + value)
end

def remove_property(property)
  run_command("npm config delete " + property)
end

def run_command(command)
  Chef::Log.logger.info("Going to run the command " + command)
  cmd = Mixlib::ShellOut.new(command, :user => username, :cwd => '/tmp', :env => nil)
  cmd.run_command
  Chef::Log.logger.info("The response was " + cmd.stdout)
  cmd.stdout
end
