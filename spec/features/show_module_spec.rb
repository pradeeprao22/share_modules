describe "user update the module", :type => :feature do
    
    before :each do
      user = User.create(:email => 'user@example.com', :password => 'password')
    end
  
    it "user update the module" do
        user = User.create(:email => 'user@example.com', :password => 'password')
        
        post = Post.create(content: "Name of the content", frontend: "<html></html>", 
            frontend_css: "<style></style>", javascript: "<script></script>", instruction: "new instructions"
        )

        visit posts_path(post.slug)

        # find('post_content', visible: false).set('This is sample post')

        # attach_file("UPLOAD SNAPSHOT", Rails.root + "spec/fixtures/module-screenshot.png")

        # fill_in 'post[frontend]', with: 'This is sample post'
        # fill_in 'post[frontend_css]', with: 'This is sample post'
        # fill_in 'post[javascript]', with: 'This is sample javascript'
        # fill_in 'post[instruction]', with: 'This are the instructions'

        # click_button 'Update Module', disabled: true

        #show page loaded success for the when visting the above slug
        expect(page).to have_http_status(200)
    end

end