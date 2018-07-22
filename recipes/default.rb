file '/etc/motd' do
  content 'Welcome to ApacheWeb Server'
  mode '0755'
  owner 'root'
  group 'root'
end

cookbook_file '/var/www/index.html' do
  source 'index.html'
  owner 'apache'
  group 'apache'
  mode '0755'
  action :create
end

package 'httpd' do
  action :install
end

template '/etc/httpd/conf/httpd.conf' do
  source 'httpd.conf.erb'
  mode '0440'
  owner 'root'
  group 'root'  
  variables(
    :httpd_port => node['httpd']['port']
  )
end

service "httpd" do
  action :start
end
