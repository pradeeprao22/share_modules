require 'rails_helper'

RSpec.describe PostsController, type: :controller do
describe "GET posts#index" do
  context "when the user is not admin" do
    it "should list titles of all modules" do
     user = User.new(
        name: "Summery",
        email: "tester@example.com",
        password: "dottle-nouveau-pavilion-tights-furze"
      )
      posts = 10.times { Post.create(user: user) }
      sign_in user
      visit posts_path

      posts.each do |post|
        page.should have_content(post.content)
      end
    end
  end
end
end