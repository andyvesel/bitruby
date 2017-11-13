require File.expand_path '../spec_helper.rb', __FILE__
require 'poloniex/connection'

describe Poloniex::Connection, 'test connection module' do
  context '.get' do
    let(:params) do
      {
        command: 'return24hVolume'
      }
    end

    it 'volume event' do
      expect(
        VCR.use_cassette('connections/return24hVolume', record: :once) do
          subject.get(params)
        end
      ).not_to be nil
    end
  end
end
