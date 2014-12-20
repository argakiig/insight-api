require 'httparty'

module Insight

  def self.api_key
    @api_key
  end

  def self.api_key=(obj)
    @api_key = obj
  end

  def self.version
    @version ||= :v1
  end

  def self.version=(obj)
    @version = obj
  end

  def self.network
    @network ||= :testnet
  end

  def self.network=(obj)
    @network = obj
  end

  def self.configure
    yield self if block_given?
  end

end

require 'insight/request'
require 'insight/address'
require 'insight/block'
require 'insight/rpc'
require 'insight/transaction'
