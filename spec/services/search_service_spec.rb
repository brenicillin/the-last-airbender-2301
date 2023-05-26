require 'rails_helper'

RSpec.describe SearchService do
  before(:each) do
    stub_request(:get, "https://last-airbender-api.fly.dev/api/v1/characters?affiliation=fire+nation&perPage=120&page=1")
     .to_return(status: 200, body: File.read('./spec/fixtures/nation_members.json'))
    stub_request(:get, "https://last-airbender-api.fly.dev/api/v1/characters?affiliation=fire+nation&perPage=25&page=1")
     .to_return(status: 200, body: File.read('./spec/fixtures/get_members.json'))
  end
  describe 'class methods' do
    it 'returns all members of a nation' do
      response = SearchService.nation_members("fire+nation")
      expect(response).to be_an(Array)
      expect(response.count).to eq(97)
      expect(response.first).to have_key(:allies)
      expect(response.first).to have_key(:enemies)
      expect(response.first).to have_key(:affiliation)
      expect(response.first).to have_key(:name)
      expect(response.second).to have_key(:photoUrl)
    end

    it 'returns the first 25 members of a nation' do
      response = SearchService.get_members("fire+nation")

      expect(response).to be_an(Array)
      expect(response.count).to eq(25)
      expect(response.first).to have_key(:allies)
      expect(response.first).to have_key(:enemies)
      expect(response.first).to have_key(:affiliation)
      expect(response.first).to have_key(:name)
      expect(response.second).to have_key(:photoUrl)
    end
  end
end