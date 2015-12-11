property :key, String, name_property: true
property :field, String

load_current_value do
  #puts("********The key is " + key)
  field get_value_from_configuration(key)
  #puts("********The key is " + key)
end

action :create do
  #puts("********The key is " + key)
  converge_if_changed :field do
    remove_property(key)
  end
end

def get_value_from_configuration(key)
  get_current_node_configuration(key)
end

def remove_property(key)
  run_command("npm config delete " + key)
end

def get_current_node_configuration(key)
  content = run_command("npm config list")
  response = key
  content.split("\n").each do |line|
    #puts("@@@@@@@ the line is " + line)
    if !key.nil? && key != "" && line.to_s.include?(key.to_s + " =") && line.to_s.include?("=")
      response = ""
    end
  end
  response
end

def run_command(command)
  Chef::Log.logger.info("Going to run the command " + command)
  cmd = Mixlib::ShellOut.new(command, :user => username, :cwd => '/tmp', :env => nil)
  cmd.run_command
  cmd.stdout
end
