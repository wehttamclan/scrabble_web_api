class OxfordService

  def conn
    Faraday.new(url: "https://od-api.oxforddictionaries.com") do |farady|
      faraday.headers["app_id"] = "#{ENV["oxford_app_id"]}"
      faraday.headers["app_key"] = "#{ENV["oxford_app_key"]}"
      faraday.adapter  Faraday.default_adapter
    end
  end
end
