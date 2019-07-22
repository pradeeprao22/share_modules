require 'rails_helper'

describe "GET posts#index" do
  context "when the user is not admin" do
    it "should list titles of all stories" do
      user = create(:user)
      posts = create_list(:post, 10, user: user)
      login_as(user, scope: :user)
      visit posts_path

      posts.each do |post|
        page.should have_content(post.content)
      end
    end
  end
end