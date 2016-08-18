def random_password
  require 'securerandom'
  SecureRandom.base64
end

default['firewall']['allow_ssh'] = true
default['firewall']['firewalld']['permanent'] = true
default['Basis']['open_ports'] = 80

default['Basis']['user'] = 'web_admin'
default['Basis']['group'] = 'web_admin'
default['Basis']['document_root'] = '/var/www/customers/public_html'

normal_unless['Basis']['database']['root_password'] = random_password
normal_unless['Basis']['database']['admin_password'] = random_password
default['Basis']['database']['dbname'] = 'my_company'
default['Basis']['database']['host'] = '127.0.0.1'
default['Basis']['database']['root_username'] = 'root'

default['Basis']['database']['admin_username'] = 'db_admin'

