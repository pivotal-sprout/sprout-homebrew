require 'spec_helper'

describe 'sprout-homebrew' do
  before :all do
    system 'soloist' or fail 'soloist failed'
  end
  
  it 'installs pstree as an example formula' do
    expect(system('which pstree')).to be_true
  end
  
  it 'installs Google Chrome as an example cask' do
    expect(File.exist?('/Applications/Google Chrome.app')).to be_true
  end
end
