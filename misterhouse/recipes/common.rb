# configure the misterhouse user/group/directory
directory node[:misterhouse][:dir] do
  mode "0755"
end

group node[:misterhouse][:group]

user node[:misterhouse][:user] do
  gid node[:misterhouse][:group]
  home node[:misterhouse][:dir]
end

directory node[:misterhouse][:dir] do
  owner node[:misterhouse][:user]
  group node[:misterhouse][:group]
end


