file '/etc/motd' do
  content 'Welcome to ApacheWeb Server'
  mode '0755'
  owner 'web_admin'
  group 'web_admin'
end

cookbook_file '/var/www/index.html' do
  source 'index.html'
  owner 'web_admin'
  group 'web_admin'
  mode '0755'
  action :create
end

package 'httpd' do
  action :install
end

template '/etc/httpd/httpd.conf' do
  source 'httpd.conf.erb'
  variables(
    :httpd_port => node['httpd']['port']
  )
end

service "httpd" do
  action :start
end
