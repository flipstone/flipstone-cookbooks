#
# Install the rake gem
#

execute "Install rake to 1.9.2" do
  command "rvm 1.9.2 exec gem install rake"
  not_if "rvm 1.9.2 gem list rake | grep rake"
  action :run
end

execute "Install rake to system" do
  command "rvm system exec gem install rake"
  not_if "rvm system gem list rake | grep rake"
  action :run
end
