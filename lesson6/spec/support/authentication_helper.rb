module AuthenticationHelper
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  def sign_in(user)
    visit sign_in_path
    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'
  end

  def sign_up(user)
    visit sign_up_path

    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password_confirmation

    click_button 'Sign Up'
  end
end
