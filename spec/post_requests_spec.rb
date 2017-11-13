require File.expand_path '../spec_helper.rb', __FILE__
require 'poloniex/post'

describe Poloniex::Post, 'test post request events' do
  let(:currency_pair) { 'BTC' }
  let(:start) { 0 }
  let(:end_time) { Time.now.to_i }

  describe 'with valid params' do
    context '.balances' do
      it 'return json response' do
        VCR.use_cassette('post_requests/balances', record: :once) do
          expect(subject.balances).not_to be nil
        end
      end
    end

    context '.trade_history' do
      subject { described_class.new(currency_pair: currency_pair, start: start, end_time: end_time) }

      it 'return json response' do
        VCR.use_cassette('post_requests/trade_history', record: :once) do
          expect(subject.trade_history).not_to be nil
        end
      end
    end
  end
end
