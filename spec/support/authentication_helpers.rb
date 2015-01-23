module AuthenticationHelpers
  def sign_in_as!(user)
    visit '/signin'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button 'Sign in'
    expect(page).to have_content("You have signed in successfully")
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def define_permission!(user, action, thing)
    Permission.create!(user: user, action: action, thing: thing)
  end
end