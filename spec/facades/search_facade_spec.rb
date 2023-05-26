require 'rails_helper'

RSpec.describe SearchFacade do
  describe 'instance methods' do
    it 'returns total members of a nation' do
      facade = SearchFacade.new("fire+nation")

      expect(facade.total_members).to eq(97)
    end

    it 'returns the first 25 members of a nation' do
      facade = SearchFacade.new("fire+nation")

      expect(facade.members.count).to eq(25)
      expect(facade.members.second).to be_a(Member)
      expect(facade.members.second.name).to eq("Circus master")
      expect(facade.members.second.allies).to eq("Ty Lee")
      expect(facade.members.second.enemies).to eq("Appa")
      expect(facade.members.second.affiliation).to eq("Fire Nation circus")
      expect(facade.members.second.photo_url).to eq("https://vignette.wikia.nocookie.net/avatar/images/a/a5/Circus_master.png/revision/latest?cb=20130706153819")
    end
  end
end