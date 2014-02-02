include_recipe "homebrew"

execute "tap phinze/homebrew-cask" do
  command "brew tap phinze/homebrew-cask"
  not_if "brew tap | grep 'cask' > /dev/null 2>&1"
end

execute "tap caskroom/versions" do
  command "brew tap caskroom/versions"
  not_if "brew tap | grep 'versions' > /dev/null 2>&1"
end

package "brew-cask"

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

execute 'update cask' do
  user node['current_user']
  command '/usr/local/bin/brew upgrade brew-cask || true'
end
