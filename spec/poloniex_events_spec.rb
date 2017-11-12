require File.expand_path '../spec_helper.rb', __FILE__
require 'poloniex_events'

describe PoloniexEvents, 'test events module' do
  context 'test get requests' do
    it '.balances' do
      VCR.use_cassette('events/balances', record: :new_episodes) do
        expect(subject.balances).not_to be nil
      end
    end
  end

  context 'test post requests' do
    let(:amount) { 0.000001 }
    let(:currency_pair) { 'BTC' }
    let(:rate) { 77_700 }

    it '.trade_history' do
      VCR.use_cassette('events/trade_history', record: :new_episodes) do
        expect(subject.trade_history(currency_pair)).not_to be nil
      end
    end
  end
end
