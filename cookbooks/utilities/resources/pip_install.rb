property :task, String, name_property: true
property :field, String

action :create do
    run_command(task)
end

def run_command(command)
  Chef::Log.logger.info("Going to run the command " + command)
  cmd = Mixlib::ShellOut.new(command, :user => username, :cwd => '/tmp', :env => nil)
  cmd.run_command
  cmd.stdout
end
