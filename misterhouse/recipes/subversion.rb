# Installs misterhouse via subversion
include_recipe "subversion"

include_recipe "misterhouse::common"

# checkout/install misterhouse
execute "checkout misterhouse" do
  command "cd #{node[:misterhouse][:dir]} && svn checkout https://misterhouse.svn.sourceforge.net/svnroot/misterhouse/#{node[:misterhouse][:subversion][:branch]} ."
  not_if { FileTest.exists?("#{node[:misterhouse][:dir]}/bin") }
end

execute "link executable" do
  command "ln -s #{node[:misterhouse][:dir]}/bin/mh /usr/local/bin/mh"
  not_if { FileTest.exists?("/usl/local/bin/mh") }
end

include_recipe "misterhouse::daemon"
