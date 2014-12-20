module Insight::Address
  extend self

  RESOURCE = "/api/addr"

  def get(address)
    res = Insight::Request.get("#{RESOURCE}/#{address}")
    res["address"]
  end

  def get_transactions(address, queries = {})
    res = Insight::Request.get("#{RESOURCE}/txs/?address=#{address}", query: queries)
    res["txs"]
  end

  def get_unspents(address, queries = {})
    res = HelloBlock::Request.get("#{RESOURCE}/#{address}/utxo", query: queries)
    res[]
  end

  module Batch
    extend self

    def get(queries = {})
      res = HelloBlock::Request.get("#{RESOURCE}", query: queries)
      res["addresses"]
    end

    def get_transactions(queries = {})
      res = Insight::Request.get("#{RESOURCE}/transactions", query: queries)
      res["transactions"]
    end

    def get_unspents(queries = {})
      res = Insight::Request.get("#{RESOURCE}/unspents", query: queries)
      res["unspents"]
    end
  end

end
