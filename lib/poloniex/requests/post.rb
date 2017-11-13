require_relative '../../constants'
require_relative '../connection'

module Poloniex
  module Requests
    module Post
      def self.balances
        Poloniex::Connection.post command: Constants::Events::Post::BALANCES
      end

      def self.trade_history(currency_pair, start = 0, end_time = Time.now.to_i)
        Poloniex::Connection.post command: Constants::Events::Post::TRADE_HISTORY,
                                  currencyPair: currency_pair,
                                  start: start,
                                  end: end_time
      end

      BUY = 'buy'.freeze
      CANCEL_ORDER = 'cancelOrder'.freeze
      OPEN_ORDER = 'returnOpenOrders'.freeze
      ORDER_TRADES = 'returnOrderTrades'.freeze
      SELL = 'sell'.freeze
      
      def self.returnOpenOrders; end
      def self.returnTradeHistory; end
      def self.returnOrderTrades; end
      def self.buy; end
      def self.sell; end
      def self.cancelOrder; end
    end
  end
end
