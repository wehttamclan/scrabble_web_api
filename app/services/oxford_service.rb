class OxfordService

  def initialize(word)
    @word = word
  end


  def inflections
    if response.status == "404"
      nil
    else
      JSON.parse(response.body, symbolize_names: true)
    end
  end

  private
  attr_reader :word

  def response
    conn.get("/api/v1/inflections/en/#{word}")
  end

  def conn
    Faraday.new(url: "https://od-api.oxforddictionaries.com") do |faraday|
      faraday.headers["app_id"] = "#{ENV["oxford_app_id"]}"
      faraday.headers["app_key"] = "#{ENV["oxford_app_key"]}"
      faraday.adapter  Faraday.default_adapter
    end
  end
end
