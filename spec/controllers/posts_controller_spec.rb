require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET #index" do
    let(:user) { FactoryGirl.create(:user) }

    it "returns http success when logged in" do
      sign_in user
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns all posts when logged in" do
      post_1 = Post.create!(description: "Best brunch place", user_id: user.id)
      post_2 = Post.create!(description: "Second best brunch place", user_id: user.id)
      sign_in user
      get :index
      expect(assigns[:posts]).to eq([post_1,post_2])
    end

    it "redirects to home when logged out" do
      get :index
      expect(response).to have_http_status(:redirect)
    end
  end
end
