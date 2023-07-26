describe "user update the module", :type => :feature do
    
    before :each do
      @user = FactoryBot.create(:user)
      @post = FactoryBot.build(:post)
      @post.user = @user
      @post.save!
    end
  
    it "user update the module" do
        login_as @user
        visit posts_path(@post.slug)

        # fill_in 'HTML', with: 'This is sample post'
        # fill_in 'CSS', with: 'This is sample post'
        # fill_in 'JAVASCRIPT', with: 'This is sample javascript'
        # fill_in 'INSTRUCTIONS', with: 'This are the instructions'

        # # attach_file("UPLOAD SNAPSHOT", Rails.root + "spec/fixtures/module-screenshot.png")

        # # click_button 'Update Module', disabled: true
    end

end