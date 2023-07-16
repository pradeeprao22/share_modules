require 'rails_helper'

RSpec.describe PostsController, type: :controller do
describe "GET posts#index" do
  context "when the user is not admin" do
    it "should list titles of all modules" do
      post = FactoryBot.build(:post)
    
      user = User.create(
        name: "Summery",
        email: "tester@example.com",
        password: "dottle-nouveau-pavilion-tights-furze"
      )
      user.confirmed_at = Date.today
      user.save!

      post.user_id = user.id
      post.save! 
      login_as user
          
      visit posts_path
      page.should have_content(post.content)
    end
  end
end
end