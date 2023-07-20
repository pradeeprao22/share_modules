describe "Editing user details", :type => :feature do

    before :each do
      @user = FactoryBot.create(:user)
    end

    it "edits user details" do
      login_as @user
      visit edit_user_registration_path
      
      fill_in 'Name', :with => 'User Example'
      fill_in 'Email', :with => 'email@londevs.com'
      fill_in 'Password', :with => 'password'
      fill_in 'Password confirmation', :with => 'password'

      click_button 'Update'

      expect(page).to have_http_status(200)
    end

end
  