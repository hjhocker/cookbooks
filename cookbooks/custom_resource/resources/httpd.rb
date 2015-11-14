property :file_name, String, name_property: true
property :html_content, String

action :create do
    file "/tmp/#{file_name}.html" do
        content "#{html_content}"
    end
end
