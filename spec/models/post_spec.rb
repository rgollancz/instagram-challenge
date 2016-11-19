require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:user) { FactoryGirl.create(:user) }
  let(:post) { Post.create!(description: "Best brunch place", user_id: user.id) }

  it "saves with a description" do
    expect(post.description).to eq("Best brunch place")
  end

  it "saves with a user owner" do
    expect(post.user_id).to eq(user.id)
  end

end
