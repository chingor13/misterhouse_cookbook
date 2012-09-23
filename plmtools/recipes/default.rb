# install plmtools from source

directory node[:plmtools][:dir] do
  group node[:plmtools][:group]
  user node[:plmtools][:user]
  action :create
end

cookbook_file "#{node[:plmtools][:dir]}/source.tar.gz" do
  group node[:plmtools][:group]
  user node[:plmtools][:user]
  source "plmtools-#{node[:plmtools][:version]}.tar.gz"
  mode "0644"
end

execute "unarchive" do
  command "cd #{node[:plmtools][:dir]} && tar -zxf source.tar.gz"
  not_if { FileTest.exists?("#{node[:plmtools][:dir]}/plmtools-#{node[:plmtools][:version]}") }
end

execute "install" do
  command "cd #{node[:plmtools][:dir]}/plmtools-#{node[:plmtools][:version]} && make install"
end
