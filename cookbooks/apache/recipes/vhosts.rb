data_bag('vhosts').each do |v|
  vhost = data_bag_item('vhosts', v)

  next if vhost['servername'].to_s.empty?

  directory "/var/www/#{vhost['servername']}" do
    owner "www-data"
    group "www-data"
    mode 0755
  end

  if %w(true yes on 1).include?(vhost['default_vhost'].to_s)
    confname = "000-#{vhost['servername']}"
  else
    confname = vhost['servername']
  end

  template "/etc/apache2/sites-available/#{confname}" do
    owner "root"
    group "root"
    mode 0644
    source "vhost.conf.erb"
    variables(
      :servername => vhost['servername'],
      :serveralias => vhost['servieralias']
    )
  end

  link "/etc/apache2/sites-enabled/#{confname}" do
    to "/etc/apache2/sites-available/#{confname}"
  end
end
