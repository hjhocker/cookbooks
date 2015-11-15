property :file_name, String, name_property: true
property :html_content, String
property :user, String

action :create do
    file "/tmp/#{file_name}.html" do
        content "#{html_content}"
    end

    execute "install_npm_test as user #{user}" do
      command "sudo -u #{user} -c 'npm install test'"
    end

end
