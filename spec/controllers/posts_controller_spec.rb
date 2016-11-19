require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET #index" do
    let(:user) { FactoryGirl.create(:user) }

    it "returns http success when logged in" do
      sign_in user
      get :index
      expect(response).to have_http_status(:success)
    end

    it "redirects to home when logged out" do
      get :index
      expect(response).to have_http_status(:redirect)
    end
  end

end
