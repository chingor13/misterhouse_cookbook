# Installs misterhouse via subversion
include_recipe "subversion"

include_recipe "misterhouse::common"

# checkout/install misterhouse
execute "checkout misterhouse" do
  command "cd #{node[:misterhouse][:dir]} && svn checkout https://misterhouse.svn.sourceforge.net/svnroot/misterhouse/#{node[:misterhouse][:subversion][:branch]} ."
  not_if { FileTest.exists?("#{node[:misterhouse][:dir]}/bin") }
end

execute "change permissions" do
  command "chown -R #{node[:misterhouse][:user]}:#{node[:misterhouse][:group]} #{node[:misterhouse][:dir]}"
end

execute "link executable" do
  command "ln -s #{node[:misterhouse][:dir]}/bin/mh /usr/local/bin/mh"
  not_if { FileTest.exists?("/usr/local/bin/mh") }
end

include_recipe "misterhouse::daemon"
