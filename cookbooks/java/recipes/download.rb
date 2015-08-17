
home = node['home']
user = node['user']

execute 'download-java8-tar' do
  cwd "/home/harrison"
  command 'wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jdk-8u51-linux-x64.tar.gz'
  not_if do ::File.exist?("/home/harrison/jdk-8u51-linux-x64.tar.gz") end
end
