# vim iptables.rb
service "iptables" do
  supports :status => true, :restart => true
end

template "/etc/sysconfig/iptables" do
  source "iptables.erb"
  group "root"
  owner "root"
  mode "0600"
 notifies :restart, 'service[iptables]' ,:immediately 
end
