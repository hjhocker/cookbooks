property :task, String, name_property: true
property :value, String
property :username, String

load_current_value do
  value is_pip_installed()
end

action :create do
  value "pip"
  converge_if_changed :value do
    Chef::Log.logger.warn("JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJThe value is " + value)
  end
end

def is_pip_installed()
  if run_command("which pip") then "pip" else "" end
end

def run_command(command)
  Chef::Log.logger.info("Going to run the command " + command)
  cmd = Mixlib::ShellOut.new(command, :user => username, :cwd => '/tmp', :env => nil)
  cmd.run_command
  cmd.exitstatus
end
