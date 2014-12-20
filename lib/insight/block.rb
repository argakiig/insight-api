module Insight::Block
  extend self

  RESOURCE = "/api/block"

  def get(block_id)
    res = Insight::Request.get("#{RESOURCE}/#{block_id}")
    res["block"]
  end

  def get_transactions(block_id, queries = {})
    res = Insight::Request.get("#{RESOURCE}/#{block_id}/transactions", query: queries)
    res["transactions"]
  end

  def get_latest(queries = {})
    res = Insight::Request.get("/api/status?q=getLastBlockHash", query: queries)
    res["blocks"]
  end

end
