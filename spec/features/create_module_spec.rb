describe 'User creats the module post', type: :feature do
  before :each do
    @user = FactoryBot.create(:user)
  end

  it 'create the post module' do
    login_as @user

    visit module_path

    fill_in 'post[content]', with: 'This is sample post'
    attach_file('file', Rails.root + 'spec/fixtures/module-screenshot.png')
    fill_in 'post[frontend]', with: 'This is sample post'
    fill_in 'post[frontend_css]', with: 'This is sample post'
    fill_in 'post[javascript]', with: 'This is sample javascript'
    fill_in 'post[instruction]', with: 'This are the instructions'
    #  click_on 'Post Module'

    #  within('#exampleModal') do
    #     click_button 'Submit'
    #  end

    #  expect(page.status_code).to eq(200)
  end
end
