require File.expand_path '../spec_helper.rb', __FILE__
require 'poloniex/get'

describe Poloniex::Get, 'test get request events' do
  let(:depth) { 10 }
  let(:currency_pair) { 'BTC' }
  let(:currency) { 'BTC_XMR' }
  let(:start) { 1_405_699_200 }
  let(:end_time) { 9_999_999_999 }
  let(:period) { 14_400 }

  context 'with valid params' do
    context '.chart_data' do
      subject { described_class.new(currency: currency, start: start, end_time: end_time, period: period) }

      it 'return json response' do
        VCR.use_cassette('get_requests/chart_data', record: :once) do
          expect(subject.chart_data).not_to be nil
        end
      end
    end

    context '.currencies' do
      it 'return json response' do
        VCR.use_cassette('get_requests/currencies', record: :once) do
          expect(subject.currencies).not_to be nil
        end
      end
    end

    context '.loan_orders' do
      subject { described_class.new(currency_pair: currency_pair) }

      it 'return json response' do
        VCR.use_cassette('get_requests/loan_orders', record: :once) do
          expect(subject.loan_orders).not_to be nil
        end
      end
    end

    context '.order_book' do
      subject { described_class.new(currency: currency, depth: depth) }

      it 'return json response' do
        VCR.use_cassette('get_requests/order_book', record: :once) do
          expect(subject.order_books).not_to be nil
        end
      end
    end

    context '.ticker' do
      it 'return json response' do
        VCR.use_cassette('get_requests/ticker', record: :once) do
          expect(subject.ticker).not_to be nil
        end
      end
    end

    context '.volume' do
      it 'return json response' do
        VCR.use_cassette('get_requests/volume', record: :once) do
          expect(subject.volume).not_to be nil
        end
      end
    end
  end
end
