directory '/etc/backup' do
  mode '0755'
  action :create
  owner node['common']['user']
  group node['common']['group']
end
