require 'addressable/uri'
require 'constants'
require 'openssl'
require 'rest-client'

module Poloniex
  module Connection
    def self.get(params = {})
      rest_client[Constants::Connection::PUBLIC].get params: params
    end

    def self.post(params = {})
      rest_client[Constants::Connection::TRADING_API].post params: params, headers: headers(params)
    end

    def self.headers(params)
      {
        Key: ENV['POLONIEX_API_KEY'],
        Sign: create_sha512_key(params)
      }
    end

    def self.create_sha512_key(params)
      params[:nonce] = Constants::Connection::NOUCE

      OpenSSL::HMAC.hexdigest(Constants::Connection::SHA512, ENV['POLONIEX_SECRET_KEY'], encoded_data(params))
    end

    def self.encoded_data(params)
      Addressable::URI.form_encode(params)
    end

    def self.rest_client
      RestClient::Resource.new(Constants::Connection::POLONIEX)
    end
  end
end
