require 'spec_helper'

describe Sitecore do
  it 'should have a version number' do
    Sitecore::VERSION.should_not be_nil
  end

  it 'should do something useful' do
    false.should eq(true)
  end
end
