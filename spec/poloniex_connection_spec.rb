require File.expand_path '../spec_helper.rb', __FILE__
require 'poloniex_connection'

describe PoloniexConnection, 'test connection module' do
  context '.get' do
    let(:params) do
      { command: 'return24hVolume' }
    end

    before { subject.get(params) }

    it 'test volume event' do
      expect(subject.get(params)).not_to be nil
    end
  end
end
