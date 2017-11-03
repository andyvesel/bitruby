require 'poloniex_connection'

BALANCES = 'returnBalances'.freeze
BUY = 'buy'.freeze
TRADE_HISTORY = 'returnTradeHistory'.freeze
SELL = 'sell'.freeze
VOLUME = 'return24hVolume'.freeze

module PoloniexEvents
  def self.balances
    PoloniexConnection.post command: BALANCES
  end

  def self.trade_history(currency_pair, start = 0, end_time = Time.now.to_i)
    PoloniexConnection.post command: TRADE_HISTORY, currencyPair: currency_pair, start: start, end: end_time
  end

  def self.volume
    PoloniexConnection.get command: VOLUME
  end
end
