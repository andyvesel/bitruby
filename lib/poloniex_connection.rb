require 'addressable/uri'
require 'openssl'
require 'rest-client'

POLONIEX = 'https://www.poloniex.com'.freeze
PUBLIC = 'public'.freeze
TRADING_API = 'tradingApi'.freeze
SHA512 = 'sha512'.freeze

module PoloniexConnection
  def self.get(params = {})
    rest_client[PUBLIC].get params: params
  end

  def self.post(params = {})
    rest_client[TRADING_API].post params: params, headers: headers(params)
  end

  def self.headers(params)
    { 
      Key: ENV['POLONIEX_API_KEY'], 
      Sign: sign_in(params) 
    }
  end

  def self.sign_in(params)
    params[:nonce] = (Time.now.to_f * 10000000).to_i

    OpenSSL::HMAC.hexdigest(SHA512, ENV['POLONIEX_SECRET_KEY'], encoded_data(params))
  end

  def self.rest_client
    RestClient::Resource.new(POLONIEX)
  end

  def self.encoded_data(params)
    Addressable::URI.form_encode(params)
  end
end
