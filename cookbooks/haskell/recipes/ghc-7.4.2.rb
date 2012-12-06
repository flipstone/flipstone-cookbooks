include_recipe "haskell::default"

version = "7.4.2"
ghc = "ghc-#{version}"
archive = "#{ghc}-i386-unknown-linux.tar.bz2"

remote_file "/tmp/#{archive}" do
  source "http://www.haskell.org/ghc/dist/#{version}/#{archive}"
  action :create_if_missing
end

bash "install_ghc_binary" do
  cwd "/tmp"
  code <<-EOH
    tar xfj #{archive}
    cd #{ghc}
    ./configure --prefix /opt/#{ghc}/#{version}
    make install
  EOH
  creates "/usr/ghc/#{version}/bin/ghc"
end

