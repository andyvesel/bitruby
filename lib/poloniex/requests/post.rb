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

      def self.volume
        Poloniex::Connection.get command: Constants::Events::Get::VOLUME
      end
    end
  end
end
