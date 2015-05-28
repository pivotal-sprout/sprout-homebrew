include_recipe 'homebrew'

directory '/usr/local/Library/Taps' do
  owner node['sprout']['user']
  recursive true
end

execute 'tap cask' do
  command 'brew tap "caskroom/homebrew-cask"'
  user node['sprout']['user']
end

package 'brew-cask'

package 'brew-cask' do
  action :upgrade
  ignore_failure true
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
