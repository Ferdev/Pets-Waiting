module HelperMethods
  def peich
    save_and_open_page
  end

  def create_and_sign_in_user
    User.make
    visit homepage
    click_link('Sign in')
    fill_in('Email', :with => 'wadus@wadus.com')
    fill_in('Password', :with => 'waduswadus')
    click_button('Sign in')
    page.should have_content('Signed in successfully.')
  end
  
  def load_master_tables
    Breed.make
  end
end

Rspec.configuration.include(HelperMethods)
