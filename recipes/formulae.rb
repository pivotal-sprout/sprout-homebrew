# node['sprout']['homebrew']['formulae'] is an array of casks
# to install (e.g. pstree, htop)
include_recipe 'homebrew'

node['sprout']['homebrew']['formulae'].each do |formula|
  Chef::Log.warn("Doing homebrew formula #{formula}")

  if formula.class == Chef::Node::ImmutableMash
    package formula.fetch(:name) do
      options '--HEAD' if formula.fetch(:head, false)
    end
  else
    package formula
  end
end
