require File.expand_path '../spec_helper.rb', __FILE__
require 'poloniex/requests/get'

describe Poloniex::Requests::Get, 'test get request events' do
  let(:depth) { 10 }
  let(:currency_pair) { 'BTC' }
  let(:currency) { 'BTC_XMR' }
  let(:start) { 1_405_699_200 }
  let(:end_time) { 9_999_999_999 }
  let(:period) { 14_400 }

  context 'with valid params' do
    it '.chart_data' do
      VCR.use_cassette('get_requests/chart_data', record: :once) do
        expect(subject.chart_data(currency, start, end_time, period)).not_to be nil
      end
    end

    it '.currencies' do
      VCR.use_cassette('get_requests/currencies', record: :once) do
        expect(subject.currencies).not_to be nil
      end
    end

    it '.loan_orders' do
      VCR.use_cassette('get_requests/loan_orders', record: :once) do
        expect(subject.loan_orders(currency_pair)).not_to be nil
      end
    end

    it '.order_book' do
      VCR.use_cassette('get_requests/order_book', record: :once) do
        expect(subject.order_books(currency, depth)).not_to be nil
      end
    end

    it '.ticker' do
      VCR.use_cassette('get_requests/ticker', record: :once) do
        expect(subject.ticker).not_to be nil
      end
    end
  end
end
