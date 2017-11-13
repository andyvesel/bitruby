require_relative 'base'

module Poloniex
  class Get < Base
    def chart_data
      poloniex_connection.get(chart_data_hash)
    end

    def currencies
      poloniex_connection.get(currencies_hash)
    end

    def loan_orders
      poloniex_connection.get(loan_orders_hash)
    end

    def order_books
      poloniex_connection.get(order_books_hash)
    end

    def ticker
      poloniex_connection.get(ticker_hash)
    end

    def volume
      poloniex_connection.get(volume_hash)
    end

    private

    def chart_data_hash
      {
        command: Constants::Events::Get::CHART_DATA,
        currencyPair: params[:currency_pair],
        start: params[:start],
        end: params[:end_time],
        period: params[:period]
      }
    end

    def currencies_hash
      {
        command: Constants::Events::Get::CURRENCIES
      }
    end

    def loan_orders_hash
      {
        command: Constants::Events::Get::LOAN_ORDERS,
        currency: params[:currency_pair]
      }
    end

    def order_books_hash
      {
        command: Constants::Events::Get::ORDER_BOOK,
        currencyPair: params[:currency_pair],
        depth: params[:depth]
      }
    end

    def ticker_hash
      {
        command: Constants::Events::Get::TICKER
      }
    end

    def volume_hash
      {
        command: Constants::Events::Get::VOLUME
      }
    end
  end
end
