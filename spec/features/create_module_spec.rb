describe "user creats the module", :type => :feature do
    
    before :each do
      user = User.create(:email => 'user@example.com', :password => 'password')
    end
  
    it "signs me in" do
        user = User.create(:email => 'user@example.com', :password => 'password')

        visit module_path
        byebug
       # within(".card.card-body") do
       page = Capybara.string(rendered)
       scoped_node = page.find(".some-class")
       
       fill_in 'post[content]', with: 'This is sample post'

            attach_file("UPLOAD SNAPSHOT", Rails.root + "spec/fixtures/module-screenshot.png")

            fill_in 'post[frontend]', with: 'This is sample post'
            fill_in 'post[frontend_css]', with: 'This is sample post'
            fill_in 'post[javascript]', with: 'This is sample javascript'
            fill_in 'post[instruction]', with: 'This are the instructions'
            click_on 'Submit'
        # end
         visit cities_path
         expect(page).to have_content('')
    end

end

# RSpec.describe PostsController, type: :controller do
#     describe "Createing module post" do
#         context "Create module post" do
#             it "should create the module" do
#                 user = User.new(
#                     name: "Summery",
#                     email: "tester@example.com",
#                     password: "dottle-nouveau-pavilion-tights-furze"
#                 )
#                 sign_in user

#                 visit module_path
#                 byebug
#                 fill_in 'post[content]', with: 'This is sample post'

#                 attach_file("UPLOAD SNAPSHOT", Rails.root + "spec/fixtures/module-screenshot.png")

#                 fill_in 'post[frontend]', with: 'This is sample post'
#                 fill_in 'post[frontend_css]', with: 'This is sample post'
#                 fill_in 'post[javascript]', with: 'This is sample javascript'
#                 fill_in 'post[instruction]', with: 'This are the instructions'


#                 click_on 'Submit'
#                 visit cities_path
#                 expect(page).to have_content('')
#             end
#         end
#     end
# end
