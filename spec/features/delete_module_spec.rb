describe "User delets the module", :type => :feature do
   
    before :each do
        @user = FactoryBot.create(:user)
        @post = FactoryBot.build(:post)
        @post.user = @user
        @post.save!
    end
    
    it "Delete the module" do
        login_as @user

        visit posts_path

        trash = find('.fa-trash-alt')
    end

end
