module Constants
  module Connection
    NOUCE = '0008'.freeze
    POLONIEX = 'https://www.poloniex.com'.freeze
    PUBLIC = 'public'.freeze
    TRADING_API = 'tradingApi'.freeze
    SHA512 = 'sha512'.freeze
  end

  module Events
    module Post
      BALANCES = 'returnBalances'.freeze
      BUY = 'buy'.freeze
      SELL = 'sell'.freeze
      VOLUME = 'return24hVolume'.freeze
    end

    module Get
      TICKER = 'returnTicker'.freeze
      ORDER_BOOK = 'returnOrderBook'.freeze
      TRADE_HISTORY = 'returnTradeHistory'.freeze
      CHART_DATA = 'returnChartData'.freeze
      CURRENCIES = 'returnCurrencies'.freeze
      LOAN_ORDERS = 'returnLoanOrders'.freeze
    end
  end
end
