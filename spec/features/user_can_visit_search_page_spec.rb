require 'rails-helper'

describe "Search form:" do
  context "When user goes to the root" do
    it "they see the first name search field" do
      visit '/'
      expect(page).to have_css('#first-name')
    end
    it "they see the last name search field" do
      visit '/'
      expect(page).to have_css('#last-name')
    end
    it "they see the zip search field" do
      visit '/'
      expect(page).to have_css('#zip')
    end
    it "they see the city search field" do
      visit '/'
      expect(page).to have_css('#city')
    end
  end
end
