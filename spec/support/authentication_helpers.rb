module AuthenticationHelpers
  def sign_in_as!(user)
    visit '/signin'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button 'Sign in'
    expect(page).to have_content("You have signed in successfully")
  end
end