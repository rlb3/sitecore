require 'spec_helper'
require 'cgi'

describe Sitecore::Url::Dsl do
  let(:base_uri) { 'http://example.com' }
  let(:site) { Sitecore::Url::Dsl.new(base_uri) }
  let(:id) { 'A60ACD61-A6DB-4182-8329-C957982CEC74' }

  it 'should only have an item_id' do
    expect(site.item_id(id).build).to eq("http://example.com/-/item/v1/?sc_itemid=#{CGI.escape('{' + id + '}')}")
  end
end
