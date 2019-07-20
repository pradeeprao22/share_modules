require 'rails_helper'

current_user = User.find_by(id: 1)
RSpec.describe Post, type: :model do
  context "with 2 or more comments" do
    it "orders them in reverse chronologically" do
      post = current_user.Post.create!
      comment1 = post.comments.create!(:content => "first comment")
      comment2 = post.comments.create!(:content => "second comment")
      expect(post.reload.comments).to eq([comment2, comment1])
    end
  end
end
