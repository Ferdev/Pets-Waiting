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
      fill_in('Address', :with => 'Fuente el Saz de Jarama, Madrid')
      fill_in('Birthday', :with => 4.years.ago)
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