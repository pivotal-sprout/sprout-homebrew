include_recipe 'homebrew'

directory '/usr/local/Library/Taps' do
  owner node['current_user']
  recursive true
end

execute 'tap cask' do
  command 'brew tap "phinze/cask"'
  user node['current_user']
end

package 'brew-cask'

package 'brew-cask' do
  action :upgrade
end

directory '/opt/homebrew-cask/Caskroom' do
  action :create
  recursive true
  mode '0755'
  owner node['current_user']
  group 'staff'
end

directory '/opt/homebrew-cask' do
  owner node['current_user']
end
