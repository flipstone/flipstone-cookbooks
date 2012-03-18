#
# Only testing against ubuntu.  Feel free to extend and test.
#
# Cookbook Name:: haskell
# Recipe:: default
# Author:: David Vollbracht
#

#package "haskell-platform" do
#  version "2011.2.0.1.1"
#  action :install
#end

include_recipe "build-essential"

%w(libgmp3c2 libgmp3-dev libedit-dev libbsd-dev zlib1g-dev freeglut3-dev).each do |p|
  package p
end

bash "link_libgmp.so" do
  cwd "/"
  code "ln -s /usr/lib/libgmp.so.3 /usr/lib/libgmp.so"
  creates '/usr/lib/libgmp.so'
end

remote_file "/tmp/ghc-7.0.3-i386-unknown-linux.tar.bz2" do
  source "http://haskell.org/ghc/dist/7.0.3/ghc-7.0.3-i386-unknown-linux.tar.bz2"
  action :create_if_missing
end

bash "install_ghc_binary" do
  cwd "/tmp"
  code <<-EOH
    tar xfj ghc-7.0.3-i386-unknown-linux.tar.bz2
    cd ghc-7.0.3
    ./configure --prefix /usr/local
    make install
  EOH
  creates '/usr/local/bin/ghc'
end

remote_file "/tmp/haskell-platform-2011.2.0.1.tar.gz" do
  source "http://lambda.galois.com/hp-tmp/2011.2.0.1/haskell-platform-2011.2.0.1.tar.gz"
  action :create_if_missing
end

bash "compile_haskell_platform" do
  cwd "/tmp"
  code <<-EOH
    tar xfz haskell-platform-2011.2.0.1.tar.gz
    cd haskell-platform-2011.2.0.1
    ./configure --prefix=/usr/local
    make && make install
  EOH
  creates "/usr/local/bin/cabal"
end

bash "install_cabal_dev_package" do
  cwd "/tmp"
  code "cabal install cabal-dev-0.9.1 --global"
  creates "/usr/local/bin/cabal-dev"
end
