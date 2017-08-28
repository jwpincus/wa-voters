require 'rails_helper'

describe "Search form:" do
  context "When user goes to the root" do
    it "they see the first name search field" do
      visit '/'
      expect(page).to have_css('#first_name')
    end
    it "they see the last name search field" do
      visit '/'
      expect(page).to have_css('#last_name')
    end
    it "they see the zip search field" do
      visit '/'
      expect(page).to have_css('#zip_code')
    end
    it "they see the city search field" do
      visit '/'
      expect(page).to have_css('#city')
    end
  end
  context "When user searches" do
    it "they can search by first name" do
      visit '/'
      fill_in('First Name', with: 'John')
      click_on 'Search'
      expect(page).to have_content('John')
    end
  end
end
