bash "install phantomjs" do
  arch = if node[:kernel][:machine] == "x86_64"
           "x86_64"
         else
           "x86"
         end

  archive = "phantomjs-#{node[:phantomjs][:version]}-linux-#{arch}-dynamic.tar.gz"

  cwd "/tmp"
  user "root"
  code %{
    rm -rf ./phantomjs;

    curl http://phantomjs.googlecode.com/files/#{archive} -o #{archive} -s;
    tar xfz #{archive};

    rm -rf /usr/local/phantomjs
    cp -r ./phantomjs /usr/local/.
    ln -s /usr/local/phantomjs/bin/phantomjs /usr/local/bin/phantomjs
  }
  creates "/usr/local/bin/phantomjs"
end
