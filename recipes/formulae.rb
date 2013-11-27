# node['sprout']['homebrew']['formulae'] is an array of casks
# to install (e.g. pstree, htop)
include_recipe "homebrew"

node['sprout']['homebrew']['formulae'].each do |formula|
  Chef::Log::warn("Doing homebrew formula #{formula}")
  package formula
end