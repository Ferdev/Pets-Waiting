module HelperMethods
  def peich
    save_and_open_page
  end
  
  def lorem
    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
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
    Size.make
  end
  
  def should_fill_address_fields
    fill_in('Address', :with => 'calle de torrelavega 62, fuente')
    within('.ui-autocomplete') do
      address = 'Calle de Torrelavega, 62, 28140 Fuente el Saz de Jarama, Spain'
      page.should have_css("a:text('#{address}')")
      page.execute_script("$('.ui-menu-item a:contains(#{address})').mouseenter().click();")
    end

    find_field('Address').value.should eq("Calle de Torrelavega, 62, 28140 Fuente el Saz de Jarama, Spain")
    find('#pet_address_attributes_street').value.should eq('Calle de Torrelavega, 62')
    find('#pet_address_attributes_postal_code').value.should eq('28140')
    find('#pet_address_attributes_lat').value.should eq('40.637086')
    find('#pet_address_attributes_lon').value.should eq('-3.510735')
    find('#pet_address_attributes_country').value.should eq('Spain')
    find('#pet_address_attributes_country_code').value.should eq('ES')
    find('#pet_address_attributes_state').value.should eq('Madrid')
    find('#pet_address_attributes_substate').value.should eq('Madrid')
    find('#pet_address_attributes_city').value.should eq('Fuente el Saz de Jarama')
  end
end

Rspec.configuration.include(HelperMethods)
