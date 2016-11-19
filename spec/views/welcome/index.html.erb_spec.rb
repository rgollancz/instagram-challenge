require 'rails_helper'

RSpec.describe "welcome/index.html.erb", type: :view do

  describe "Homepage" do
    scenario "visit from logged out user" do
      visit '/'
      expect(page).to have_content("Welcome to Makergram!")
    end
  end
end
