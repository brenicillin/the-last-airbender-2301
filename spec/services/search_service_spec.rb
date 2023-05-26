require 'rails_helper'

RSpec.describe SearchService do
  describe 'class methods' do
    it 'returns all members of a nation' do
      response = SearchService.nation_members("fire+nation")
      expect(response).to be_an(Array)
      expect(response.count).to eq(97)
      expect(response.first).to have_key(:allies)
      expect(response.first).to have_key(:enemies)
      expect(response.first).to have_key(:affiliation)
      expect(response.first).to have_key(:name)
      expect(response.first).to have_key(:photoUrl)
    end

    it 'returns the first 25 members of a nation' do
      response = SearchService.get_members("fire+nation")

      expect(response).to be_an(Array)
      expect(response.count).to eq(25)
      expect(response.first).to have_key(:allies)
      expect(response.first).to have_key(:enemies)
      expect(response.first).to have_key(:affiliation)
      expect(response.first).to have_key(:name)
      expect(response.first).to have_key(:photoUrl)
    end
  end
end