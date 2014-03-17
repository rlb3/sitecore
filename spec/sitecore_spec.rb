require 'spec_helper'

describe Sitecore do
  it 'should have a version number' do
    Sitecore::VERSION.should_not be_nil
  end
end
