describe 'the signin process', type: :feature do
  before :each do
    User.create(email: 'user@example.com', password: 'password')
  end

  it 'signs me in' do
    visit new_user_session_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'

    expect(page.status_code).to eq(200)
  end
end
