require File.expand_path '../spec_helper.rb', __FILE__
require 'poloniex/requests/post'

describe Poloniex::Requests::Post, 'test post request events' do
  let(:currency_pair) { 'BTC' }
  let(:start) { 0 }
  let(:end_time) { Time.now.to_i }

  context 'with valid params' do
    it '.balances' do
      VCR.use_cassette('post_requests/balances', record: :once) do
        expect(subject.balances).not_to be nil
      end
    end

    it '.trade_history' do
      VCR.use_cassette('post_requests/trade_history', record: :once) do
        expect(subject.trade_history(currency_pair: currency_pair, start: start, end_time: end_time)).not_to be nil
      end
    end
  end
end
