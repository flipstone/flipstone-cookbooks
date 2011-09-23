class Chef
  class Recipe
    def monitrc(name, variables={})
      Chef::Log.debug("Checking monitrc for: #{name}")
      template "/etc/monit/conf.d/#{name}.#{variables[:app_name]}.monitrc" do
        owner "root"
        group "root"
        mode 0644
        source "#{name}.monitrc.erb"
        variables variables
        notifies :run, resources(:execute => "restart-monit")
        action :create_if_missing
      end
    end
  end
end  
