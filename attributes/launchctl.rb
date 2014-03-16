# node['sprout']['homebrew']['launchctl'] is a Hash of homebrew packages
# whose launch agent definitions are available at the usual
# /usr/local/opt/#{package}/homebrew.mxcl.#{package}.plist
#
# example:
# {'mongodb' => 'load'}

node.default['sprout']['homebrew']['launchctl']={}

