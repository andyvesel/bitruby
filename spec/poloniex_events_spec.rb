require File.expand_path '../spec_helper.rb', __FILE__
require 'poloniex_events'
require 'byebug'

describe PoloniexEvents, 'test events module' do
  context 'test get requests' do
    it '.balances' do
      expect(subject.balances).not_to be nil
    end
  end

  context 'test post requests' do
    let(:amount) { 0.000001 }
    let(:currency_pair) { 'BTC' }
    let(:rate) { 77_700 }

    it '.trade_history' do
      expect(subject.trade_history(currency_pair)).not_to be nil
    end
  end
end
