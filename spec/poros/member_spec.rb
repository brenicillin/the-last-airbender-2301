require 'rails_helper'

RSpec.describe Member do
  describe '#initialize' do
    it 'exists with attributes' do
      member_data = {
        name: "Test Member",
        allies: ["Ally 1", "Ally 2"],
        enemies: ["Enemy 1", "Enemy 2"],
        affiliation: "Test Affiliation",
        photoUrl: "https://testurl.com"
      }

      member = Member.new(member_data)

      expect(member.name).to eq("Test Member")
      expect(member.allies).to eq("Ally 1, Ally 2")
      expect(member.enemies).to eq("Enemy 1, Enemy 2")
      expect(member.affiliation).to eq("Test Affiliation")
      expect(member.photo_url).to eq("https://testurl.com")
    end
  end
end