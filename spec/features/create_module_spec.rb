describe "User creats the module", :type => :feature do
    
    before :each do
      user = User.create(:email => 'user@example.com', :password => 'password')
    end
  
    it "Create the post module" do
       user = User.create(:name => 'example', :email => 'user@example.com', :password => 'password')
       user.confirmed_at = Date.today
       user.save!

       login_as user

       visit module_path
       
       fill_in 'post[content]', with: 'This is sample post'
       fill_in 'post[frontend]', with: 'This is sample post'
       fill_in 'post[frontend_css]', with: 'This is sample post'
       fill_in 'post[javascript]', with: 'This is sample javascript'
       fill_in 'post[instruction]', with: 'This are the instructions'
       byebug
       attach_file("UPLOAD SNAPSHOT", Rails.root + "spec/fixtures/module-screenshot.png")

       click_on 'Post Module'
       
       visit posts_path

       expect(page).to have_content(user.post.content)
    end

end
