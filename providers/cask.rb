action :install do
  run_context.include_recipe 'sprout-homebrew::cask'
  package = new_resource.name

  execute "brew cask install #{package}" do
    only_if "brew cask info #{package} | grep 'Not installed' > /dev/null 2>&1"
    user node['sprout']['user']
    command "brew cask install #{new_resource.opts} #{package}"
  end

  new_resource.updated_by_last_action(true)
end
