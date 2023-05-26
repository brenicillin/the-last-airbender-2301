class SearchService
  def self.get_url(url)
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.nation_members(nation)
    get_url("https://last-airbender-api.fly.dev/api/v1/characters?affiliation=#{nation}&perPage=120&page=1")
  end

  def self.get_members(nation)
    get_url("https://last-airbender-api.fly.dev/api/v1/characters?affiliation=#{nation}&perPage=25&page=1")
  end
end