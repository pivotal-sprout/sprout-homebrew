launch_agents_path = File.expand_path('~/Library/LaunchAgents')

directory launch_agents_path do
  action :create
  recursive true
  owner node['sprout']['user']
end

node['sprout']['homebrew']['launchctl'].each do |package, subcommand|
  installation_path = File.expand_path("/usr/local/opt/#{package}")
  plist = "homebrew.mxcl.#{package}.plist"

  case subcommand
  when 'load'

    execute 'start at login' do
      command "ln -sfv #{File.join(installation_path, plist)} #{launch_agents_path}"
      user node['sprout']['user']
    end

    execute 'start now' do
      command "launchctl load -w #{File.join(launch_agents_path, plist)}"
      user node['sprout']['user']
    end

  when 'unload'

    execute 'stop' do
      command "launchctl unload -w #{File.join(launch_agents_path, plist)}"
      user node['sprout']['user']
      only_if "test -L #{File.join(launch_agents_path, plist)}"
    end

    link File.join(launch_agents_path, plist) do
      action :delete
      only_if "test -L #{File.join(launch_agents_path, plist)}"
    end

  when 'reload'

    execute 'stop now' do
      command "launchctl unload -w #{File.join(launch_agents_path, plist)}"
      user node['sprout']['user']
    end

    execute 'start now' do
      command "launchctl load -w #{File.join(launch_agents_path, plist)}"
      user node['sprout']['user']
    end

  end
end
