module HelperMethods
  def peich
    save_and_open_page
  end

  def create_and_sign_in_user
    user = User.create(:email => 'wadus@wadus.com', :password => 'waduswadus', :password_confirmation => 'waduswadus')
    visit homepage
    click_link('Sign in')
    fill_in('Email', :with => 'wadus@wadus.com')
    fill_in('Password', :with => 'waduswadus')
    click_button('Sign in')
  end
end

Rspec.configuration.include(HelperMethods)
