require_relative 'base'

module Poloniex
  class Post < Base
    def balances
      poloniex_connection.post(command: Constants::Events::Post::BALANCES)
    end

    def buy
      poloniex_connection.post(buy_hash)
    end

    def sell
      poloniex_connection.post(sell_hash)
    end

    def trade_history
      poloniex_connection.post(trade_history_hash)
    end

    private

    def buy_hash
      {
        command: Constants::Events::Post::BUY,
        currencyPair: params[:currencyPair],
        rate: params[:rate],
        amount: params[:amount]
      }
    end

    def sell_hash
      {
        command: Constants::Events::Post::SELL,
        currencyPair: params[:currencyPair],
        rate: params[:rate],
        amount: params[:amount]
      }
    end

    def trade_history_hash
      {
        command: Constants::Events::Post::TRADE_HISTORY,
        currencyPair: params[:currency_pair],
        start: params[:start],
        end: params[:end_time]
      }
    end

    def return_open_orders; end

    def return_trade_history; end

    def return_order_trades; end

    def cancel_order; end
  end
end
