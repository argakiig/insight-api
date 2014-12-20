module Insight::Transaction
  extend self

  RESOURCE = "/api/tx"

  def get(tx_hash)
    res = Insight::Request.get("#{RESOURCE}/#{tx_hash}")
    res["transaction"]
  end

  def get_latest(queries = {})
    res = Insight::Request.get("#{RESOURCE}/latest")
    res["transactions"]
  end

  def propagate(body = {})
    res = Insight::Request.post("#{RESOURCE}/send", body: body)
    res["transaction"]
  end

  module Batch
    extend self

    def get(queries = {})
      res = Insight::Request.get("#{RESOURCE}", query: queries)
      res["transactions"]
    end

  end
end
