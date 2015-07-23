1. Create a new cookbook for jenkins: berks cookbook jenkins
2. Add the following line to the Berksfile: 'cookbook "apt", "~> 2.7.0"'
  --> Note, this will create a folder called ~/.berkshelf/cookbooks/apt-2.7.0/ if you get an error about `ERROR: cookbook_file/etc/apt/apt.conf.d/15update-stamp had an error` then rename the directory to ~/.berkshelf/cookbooks/apt/ 
3. Add the following line to the metadata.rb file: `depends 'apt'`
4. Update the solo.rb configuration file to add the ~/.berkshelf/cookbooks/ directory to the list of cookbook locations
5. In the Jenkins default.rb recipe, add the following line to the top: include_recipe 'apt'
