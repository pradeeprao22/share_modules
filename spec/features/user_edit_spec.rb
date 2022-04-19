describe "Edit user details", :type => :feature do
  
    before :each do
        User.create(:email => 'user@example.com', :password => 'password')
    end

    it "Edit user details" do
      visit edit_user_registration_path
      
      fill_in 'Name', :with => 'Example User'
      fill_in 'Email', :with => 'email@londevs.com'
      fill_in 'Password', :with => 'password'
      fill_in 'Confirm Password', :with => 'password'

      click_button 'Update'

      expect(page).to have_http_status(200)
    end

end
  