include_recipe 'homebrew'

directory '/usr/local/Library/Taps' do
  owner node['sprout']['user']
  recursive true
end

directory '/opt/homebrew-cask/Caskroom' do
  action :create
  recursive true
  mode '0755'
  owner node['sprout']['user']
  group 'staff'
end

directory '/opt/homebrew-cask' do
  owner node['sprout']['user']
end
