require_relative '../../constants'
require_relative '../connection'

module Poloniex
  module Requests
    module Get
      def self.chart_data(currency_pair, start = 0, end_time = Time.now.to_i, period)
        Poloniex::Connection.get command: Constants::Events::Get::CHART_DATA,
                                 currencyPair: currency_pair,
                                 start: start,
                                 end: end_time,
                                 period: period
      end

      def self.currencies
        Poloniex::Connection.get command: Constants::Events::Get::CURRENCIES
      end

      def self.loan_orders(currency)
        Poloniex::Connection.get command: Constants::Events::Get::LOAN_ORDERS, currency: currency
      end

      def self.order_books(currency_pair, depth)
        Poloniex::Connection.get command: Constants::Events::Get::ORDER_BOOK, 
                                 currencyPair: currency_pair, 
                                 depth: depth
      end

      def self.ticker
        Poloniex::Connection.get command: Constants::Events::Get::TICKER
      end
    end
  end
end
