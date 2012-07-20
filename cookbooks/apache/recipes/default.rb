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

cookbook_file "/etc/apache2/conf.d/security" do
  owner "root"
  group "root"
  mode 0644
  source "security"
end

file "/etc/apache2/sites-enabled/000-default" do
  action :delete
end

file "/var/www/index.html" do
  owner "root"
  group "root"
  mode 0644
  content "<!-- hello -->\n"
  only_if "grep -q 'It works' /var/www/index.html"
end
