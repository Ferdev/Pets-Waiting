require File.dirname(__FILE__) + '/acceptance_helper'

feature "Pets", %q{
  In order to allow pets adoption
  As a user
  I want to create, update and delete pets
} do

  context "Signed in user" do
    background do
      load_master_tables
      create_and_sign_in_user
    end

    scenario 'can register a new pet' do
      visit homepage
      click_link('Add a new pet')
      fill_in('Name', :with => 'Scroophy')
      select('Dog', :from => 'Animal')
      select('Crossbred', :from => 'Breed')
      fill_in('Address', :with => 'calle de torrelavega 62, fuente')
      within('.ui-autocomplete') do
        page.should have_css('a:text("Calle de Torrelavega, 62, 28140 Fuente el Saz de Jarama, Spain")')
        page.execute_script("$('.ui-menu-item a:contains(Calle de Torrelavega, 62, 28140 Fuente el Saz de Jarama, Spain)').mouseenter().click();")
      end
      should_fill_address_fields
      select(4.years.ago.strftime("%Y") , :from => 'Year')
      select(4.years.ago.strftime("%B") , :from => 'Month')
      select(4.years.ago.strftime("%d") , :from => 'Day')
      check('Urgent')
      check('Docile')
      check('Playful')
      check('Obedient')
      select('Medium', :from => 'Size')
      assert_difference "Pet.count", 1 do
        click_button('Submit')
        page.should have_content('Pet created successfully.')
      end
    end
  end


end