file '/etc/motd' do
  content 'Welcome to ApacheWeb Server'
  mode '0755'
  owner 'root'
  group 'root'
end

package 'httpd' do
  action :install
end

cookbook_file '/var/www/html/index.html' do
  source 'index.html'
  owner 'apache'
  group 'apache'
  mode '0755'
  action :create
end

template '/etc/httpd/conf/httpd.conf' do
  source 'httpd.conf.erb'
  mode '0440'
  owner 'root'
  group 'root'
end

service "httpd" do
  action :start
end
