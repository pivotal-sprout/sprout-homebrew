# node['sprout']['homebrew']['casks'] is an array of casks
# to install (e.g. flash, firefox, chrome)
include_recipe 'homebrew'

node['sprout']['homebrew']['casks'].each do |cask|
  Chef::Log::warn("Doing cask #{cask}")
  sprout_osx_apps_homebrew_cask cask
end