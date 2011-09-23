case node[:platform]
when "ubuntu","debian"
  
  execute "apt-get update" do
    command "apt-get update -o Acquire::http::No-Cache=True" 
    action :run
  end
  
end