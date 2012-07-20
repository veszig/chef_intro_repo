package "apache2-mpm-worker"

servername = node['apache']['servername'].to_s.empty? ? node['fqdn'] : node['apache']['servername']

template "/etc/apache2/conf.d/identity" do
  owner "root"
  group "root"
  mode 0644
  source "identity.erb"
  variables(
    :servername => servername,
    :serveradmin => node['apache']['serveradmin']
  )
end
