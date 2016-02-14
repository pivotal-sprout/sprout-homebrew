require 'spec_helper'

describe 'sprout-homebrew' do
  before :all do
    system 'brew services stop tor'
    system 'brew install tor'
    system 'soloist' || raise('soloist failed')
  end

  it 'loads the tor agent as an example daemon' do
    expect(system('pgrep -x tor')).to eq(true)
  end
end
