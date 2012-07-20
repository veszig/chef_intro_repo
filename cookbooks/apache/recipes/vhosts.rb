directory "/var/www/foobar.com" do
  owner "www-data"
  group "www-data"
  mode 0755
end

template "/etc/apache2/sites-available/foobar.com" do
  owner "root"
  group "root"
  mode 0644
  source "vhost.conf.erb"
  variables(
    :servername => "foobar.com",
    :serveralias => "www.foobar.com"
  )
end

link "/etc/apache2/sites-enabled/foobar.com" do
  to "/etc/apache2/sites-available/foobar.com"
end
