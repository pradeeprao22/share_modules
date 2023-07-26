describe "Editing user details", :type => :feature do

    before :each do
      @user = FactoryBot.create(:user)
      @post = FactoryBot.build(:post)
      @post.user = @user
      @post.save
    end

    it "edits user details" do
      login_as @user
      visit edit_user_registration_path
      
      fill_in 'Name', :with => 'User Example'
      fill_in 'Email', :with => 'email@londevs.com'
      fill_in 'Password', :with => 'password'
      fill_in 'Password confirmation', :with => 'password'


      # Perform assertions on the status code
      expect(page.status_code).to eq(200)
    end

end
  