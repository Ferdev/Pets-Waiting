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
      fill_in("Pet's name", :with => 'Scroophy')
      select('Dog', :from => 'Kind of animal')
      select('Crossbred', :from => 'Breed')
      should_fill_address_fields
      select(4.years.ago.strftime("%Y") , :from => 'Year')
      select(4.years.ago.strftime("%B") , :from => 'Month')
      select(4.years.ago.strftime("%d") , :from => 'Day')
      check('Is this an urgent adoption?')
      check('Docile')
      check('Playful')
      check('Obedient')
      select('Medium', :from => 'Size')
      fill_in('Description', :with => Faker::Lorem.paragraphs)
      assert_difference "Pet.count", 1 do
        click_button('Save Pet')
        page.should have_content('Pet was successfully saved.')
      end
    end
  end


end