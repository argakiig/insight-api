module Insight::RPC
  extend self

  def getrawtransaction(queries = {})
    res = Insight::Request.get("/getrawtransaction", query: queries)
    res["transactions"]
  end

end
