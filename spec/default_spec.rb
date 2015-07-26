require 'spec_helper'

describe 'sprout-homebrew' do
  before :all do
    system 'brew services stop tor'
    system 'brew uninstall tor'
    system 'brew uninstall hub'
    system 'brew cask uninstall google-chrome'
    system 'soloist' or fail 'soloist failed'
  end

  it 'installs tor as an example formula' do
    expect(system('which tor')).to be_true
  end

  it 'installs the preview version of hub as an example formula' do
    semver = '\d+\.\d+\.\d+'
    sha = '[a-f0-9]{7}'
    expect(`hub --version`).to match(/#{semver}-g#{sha}/)
  end

  it 'loads the tor agent as an example daemon' do
    expect(system('pgrep -x tor')).to be_true
  end

  it 'installs Google Chrome as an example cask' do
    expect(File.exist?('/Applications/Google Chrome.app')).to be_true
  end
end
