require 'rails_helper'

RSpec.describe "posts/index.html.erb", type: :view do

    it "displays all posts" do
      create_user
      add_post
      expect(page).to have_content("My favourite spot in the city")
    end

    it "displays comments on posts" do
      create_user
      add_post
      add_comment
      expect(page).to have_content("Looks so nice!")
    end
end
