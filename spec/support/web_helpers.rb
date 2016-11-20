module WebHelpers

  def create_user
    visit '/'
    click_link 'Register'
    fill_in 'Email', with: "test@testuser.com"
    fill_in 'Password', with: "123456"
    fill_in 'Password confirmation', with: "123456"
    click_button 'Sign up'
  end

  def create_user2
    visit '/'
    click_link 'Register'
    fill_in 'Email', with: "test2@testuser.com"
    fill_in 'Password', with: "123456"
    fill_in 'Password confirmation', with: "123456"
    click_button 'Sign up'
  end

  def add_post
    visit '/posts'
    click_link 'Add new post'
    attach_file "post_image", "spec/asset_specs/photos/test.jpg"
    fill_in 'post_description', with: "My favourite spot in the city"
    click_button 'Save'
  end

  def add_comment
    visit '/posts'
    click_link 'Add comment'
    fill_in 'comment_content', with: "Looks so nice!"
    click_button "Save"
  end
end
