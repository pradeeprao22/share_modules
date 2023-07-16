# require 'rails_helper'

# RSpec.describe Post, type: :model do
#   context "with 2 or more comments" do
#     it "orders them in reverse chronologically" do
#       current_user = user = User.create(
#         name: "Summer",
#         email: "tester@example.com",
#         password: "dottle-nouveau-pavilion-tights-furze",
#         confirmed_at: Date.today
#       )

#       post = Post.create(
#         content: "example post",
#         frontend: "<html></html>",
#         backend: "nil",
#         frontend_css: "<style></style>",
#         javascript: "<script></script>",
#         user_id: current_user.id
#       )

#       comment1 = post.comments.create!(:content => "first comment", :user_id => current_user.id)
#       comment2 = post.comments.create!(:content => "second comment", :user_id => current_user.id)
#       expect(post.reload.comments).to eq([comment2, comment1])
#     end
#   end
# end
