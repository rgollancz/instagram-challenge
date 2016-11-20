require 'rails_helper'

RSpec.describe "welcome/index.html.erb", type: :view do

  describe "Homepage" do
    scenario "display welcome to logged out user" do
      visit '/'
      expect(page).to have_content("Welcome to Makergram!")
    end

    scenario "redirects logged in user to posts" do
      create_user
      visit '/'
      follow_redirect!
      expect(page).to have_content("Recent posts")
    end
  end
end
