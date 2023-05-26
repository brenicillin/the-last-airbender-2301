require 'rails_helper'

RSpec.describe 'Search index page', type: :feature do
  describe 'As a user' do
    it 'I can search for members of a nation' do
      visit '/'

      select 'Fire Nation', from: :nation
      click_button 'Search For Members'
      
      expect(current_path).to eq(search_path)
      within('#total-members') do
        expect(page).to have_content('Total Members: 97')
      end

      within ('#members') do
        expect(page).to have_content("Name: Afiko")
        expect(page).to have_content("Allies: Fire Nation")
        expect(page).to have_content("Enemies: Aang")
        expect(page).to have_content("Affiliations: Fire Nation")
      end
    end
  end
end