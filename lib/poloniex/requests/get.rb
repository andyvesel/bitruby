require_relative '../../constants'
require_relative '../connection'

module Poloniex
  module Requests
    module Get
      # Methods
      #
      def self.chart_data(params = {})
        Poloniex::Connection.get(chart_data_hash(params))
      end

      def self.currencies
        Poloniex::Connection.get(currencies_hash)
      end

      def self.loan_orders(params = {})
        Poloniex::Connection.get(loan_orders_hash(params))
      end

      def self.order_books(params = {})
        Poloniex::Connection.get(order_books_hash(params))
      end

      def self.ticker
        Poloniex::Connection.get(ticker_hash)
      end

      def self.volume
        Poloniex::Connection.get(volume_hash)
      end

      # Hashes
      #
      def self.chart_data_hash(params)
        {
          command: Constants::Events::Get::CHART_DATA,
          currencyPair: params[:currency_pair],
          start: params[:start],
          end: params[:end_time],
          period: params[:period]
        }
      end

      def self.currencies_hash
        {
          command: Constants::Events::Get::CURRENCIES
        }
      end

      def self.loan_orders_hash(params)
        {
          command: Constants::Events::Get::LOAN_ORDERS,
          currency: params[:currency_pair]
        }
      end

      def self.order_books_hash(params)
        {
          command: Constants::Events::Get::ORDER_BOOK,
          currencyPair: params[:currency_pair],
          depth: params[:depth]
        }
      end

      def self.ticker_hash
        {
          command: Constants::Events::Get::TICKER
        }
      end

      def self.volume_hash
        {
          command: Constants::Events::Get::VOLUME
        }
      end
    end
  end
end
