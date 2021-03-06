module Insight::Request
  extend self

  def base
    "http://localhost:3001"
  end

  def post(endpoint, body: {})
    # ensure / at end of endpoint
    response = HTTParty.post("#{base()}#{endpoint}", body: body)

    if response.code != 200
      body = JSON.parse(response.body)
      p body
      raise "#{body["message"]}"
    end
    return response["data"]
  end

  def get(endpoint, query: {})
    response = HTTParty.get("#{base()}#{endpoint}", query: query)

    if response.code != 200
      body = JSON.parse(response.body)
      p body
      raise "#{body["message"]}"
    end
    return response["data"]
  end

end
