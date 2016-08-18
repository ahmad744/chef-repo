def random_password
  require 'securerandom'
  SecureRandom.base64
end

default['firewall']['allow_ssh'] = true
default['firewall']['firewalld']['permanent'] = true
default['ip3']['open_ports'] = 80

default['ip3']['user'] = 'web_admin'
default['ip3']['group'] = 'web_admin'
default['ip3']['document_root'] = '/var/www/customers/public_html'

default_unless['ip3']['database']['root_password'] = random_password
default_unless['ip3']['database']['admin_password'] = random_password
default['ip3']['database']['dbname'] = 'my_company'
default['ip3']['database']['host'] = '127.0.0.1'
default['ip3']['database']['root_username'] = 'root'
default['ip3']['database']['admin_username'] = 'db_admin'
