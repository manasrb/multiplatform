require 'spec_helper'
describe 'multiplatform' do
  context 'with default values for all parameters' do
    it { should contain_class('multiplatform') }
  end
end
