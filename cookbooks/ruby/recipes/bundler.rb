#
# Install the bundler gem
#

BundlerVersion = "1.0.10"

execute "Install bundler to 1.9.2" do
  command "rvm 1.9.2 exec gem install bundler -v#{BundlerVersion}"
  not_if "rvm 1.9.2 gem list bundler | grep #{BundlerVersion}"
  action :run
end

execute "Install bundler to system" do
  command "rvm system exec gem install bundler -v#{BundlerVersion}"
  not_if "rvm system gem list bundler | grep #{BundlerVersion}"
  action :run
end

cookbook_file "/usr/bin/bundle" do
  source "bundle"
  mode "0655"
end