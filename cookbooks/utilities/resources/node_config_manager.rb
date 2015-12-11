property :username, String
property :key, String, name_property: true
property :value, String

load_current_value do
  value get_value_from_configuration(key)
end

action :create do
  converge_if_changed :value do
    add_property(key,value)
  end
  #Chef::Log.logger.warn("\nThe node value for " + key + " is " + value)
end

action :delete do
  utilities_node_delete key do
    action :delete
    field key
  end
end

def get_value_back(key)
  key
end

def resolve_npm_path
  run_command("which npm")
end

def get_property_from_configuration(key)
  get_current_node_configuration(key)
end

def get_value_from_configuration(key)
  get_current_node_configuration(key)
end

def get_current_node_configuration(key)
  content = run_command("npm config list")
  response = ""
  #puts("************** the key is " + key.to_s)
  content.split("\n").each do |line|
    if !key.nil? && line.to_s.include?(key.to_s + " =") && line.to_s.include?("=")
      response = line.to_s.split("=")[1].strip().gsub('"','')
    end
  end
  puts("The response is " + response)
  response
end

def add_property(key, value)
  puts("Setting " + key + " to " + value)
  run_command("npm config set " + key + " " + value)
end

def remove_property(key)
  run_command("npm config delete " + key)
end

def run_command(command)
  Chef::Log.logger.info("Going to run the command " + command)
  cmd = Mixlib::ShellOut.new(command, :user => username, :cwd => '/tmp', :env => nil)
  cmd.run_command
  #Chef::Log.logger.info("The response was " + cmd.stdout)
  cmd.stdout
end
