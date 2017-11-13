require_relative '../../constants'
require_relative '../connection'

module Poloniex
  module Requests
    module Post
      # Methods
      #
      def self.balances
        Poloniex::Connection.post(command: Constants::Events::Post::BALANCES)
      end

      def self.buy(params = {})
        Poloniex::Connection.post(buy_hash(params))
      end

      def self.sell(params = {})
        Poloniex::Connection.post(sell_hash(params))
      end

      def self.trade_history(params = {})
        Poloniex::Connection.post(trade_history_hash(params))
      end

      # Hashes
      #
      def self.buy_hash(params)
        {
          command: Constants::Events::Post::BUY,
          currencyPair: params[:currencyPair],
          rate: params[:rate],
          amount: params[:amount]
        }
      end

      def self.sell_hash(params)
        {
          command: Constants::Events::Post::SELL,
          currencyPair: params[:currencyPair],
          rate: params[:rate],
          amount: params[:amount]
        }
      end

      def self.trade_history_hash(params)
        {
          command: Constants::Events::Post::TRADE_HISTORY,
          currencyPair: params[:currency_pair],
          start: params[:start],
          end: params[:end_time]
        }
      end

      def self.returnOpenOrders; end

      def self.returnTradeHistory; end

      def self.returnOrderTrades; end

      def self.cancelOrder; end
    end
  end
end
