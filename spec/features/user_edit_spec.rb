describe "Editing user details", :type => :feature do

    before :each do
      @user = User.create(:name => 'example user', :email => 'user@example.com', :password => 'password')
    end

    it "edits user details" do
      login_as @user
    
      visit '/edit'
      # click_link('Edit Profile')
      
      fill_in 'user_name', :with => 'User'
      fill_in 'user[email]', :with => 'email@londevs.com'
      fill_in 'user[password]', :with => 'password'
      fill_in 'user[password_confirmation]', :with => 'password'

      click_button 'Update'

      expect(page).to have_http_status(200)
    end

end
  