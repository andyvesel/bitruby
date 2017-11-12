require 'constants'
require 'poloniex_connection'

module PoloniexEvents
  def self.balances
    PoloniexConnection.post command: Constants::BALANCES
  end

  def self.trade_history(currency_pair, start = 0, end_time = Time.now.to_i)
    PoloniexConnection.post command: Constants::TRADE_HISTORY, currencyPair: currency_pair, start: start, end: end_time
  end

  def self.volume
    PoloniexConnection.get command: Constants::VOLUME
  end
end
