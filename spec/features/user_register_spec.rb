describe 'the signup process', type: :feature do
  it 'sign me up' do
    visit new_user_registration_path

    fill_in 'Name', with: 'Example User'
    fill_in 'Email', with: 'email@londevs.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirm Password', with: 'password'

    click_button 'Sign up'

    expect(page).to have_selector('h4', text: 'LonDevs')
  end
end
