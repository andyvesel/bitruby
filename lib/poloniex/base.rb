require_relative '../constants'
require_relative 'connection'

module Poloniex
  class Base
    def initialize(params = {})
      @params = params
      @poloniex_connection ||= Poloniex::Connection.new
    end

    attr_reader :params, :poloniex_connection
  end
end
