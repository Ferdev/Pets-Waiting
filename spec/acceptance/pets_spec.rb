require File.dirname(__FILE__) + '/acceptance_helper'

feature "Pets", %q{
  In order to allow pets adoption
  As a user
  I want to create, update and delete pets
} do

  context "Signed in users" do
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
      check('Urgent adoption')
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
    
    scenario 'must provide name, kind of animal, breed, address and birthday fields to add a new pet' do
      visit homepage
      click_link('Add a new pet')
      assert_difference "Pet.count", 0 do
        click_button('Save Pet')
        page.should have_css('#pet_name_input.required.error p', :text => "can't be blank")
        page.should have_css('#pet_animal_input.required.error p', :text => "can't be blank")
        page.should have_css('#pet_breed_input.required.error p', :text => "can't be blank")
        page.should have_css('#pet_address_attributes_address_input.required.error p', :text => "can't be blank")
        page.should have_css('#pet_birthday_input.required.error p', :text => "can't be blank")
      end
    end
  end
  
  context "Everyone" do
    background do
      # For some reason, creating the address association in the pet's blueprint doesn't work
      # (the address' blueprint is not invoked)
      Pet.make(:address => Address.make)
    end
    
    scenario "can see a list of pets" do
      visit homepage
      page.should have_css('.pets.filters')
      page.should have_css('.pets.results')
      within('.pets.results ul li.pet a') do
        find('span.name').text.should eq('Wadus')
        find('span.animal').text.should eq('Kind of animal: Dog')
        find('span.age').text.should eq('Age: about 4 years')
        find('span.place').text.should eq('Place: Calle de Torrelavega, 62, 28140 Fuente el Saz de Jarama, Spain')
        find('span.urgent').text.should eq('Urgent adoption')
      end
    end
    
    scenario "can see a pet's detail" do
      visit homepage
      find_link('Wadus').click
      within('ul.pet.detail') do
        within('li.name') do
          page.should have_content('Wadus')
        end
        within('li.photos') do
          page.should have_css('.ad-gallery')
          page.should have_css('.ad-gallery .ad-image-wrapper')
          page.should have_css('.ad-gallery .ad-nav')
          page.should have_css('.ad-gallery .ad-nav .ad-thumbs')
          page.should have_css('.ad-gallery .ad-nav .ad-thumbs ul.ad-thumb-list')
        end
        within('li.urgent') do
          page.should have_content('Urgent adoption')
        end
        within('li.animal') do
          page.should have_css('span.label', :text => 'Kind of animal:')
          page.should have_content('Dog')
        end
        within('li.breed') do
          page.should have_css('span.label', :text => 'Breed:')
          page.should have_content('Crossbred')
        end
        within('li.age') do
          page.should have_css('span.label', :text => 'Age:')
          page.should have_content('About 4 years')
        end
        within('li.place') do
          page.should have_css('span.label', :text => 'Place:')
          page.should have_content('Calle de Torrelavega, 62, 28140 Fuente el Saz de Jarama, Spain')
        end
        within('li.character') do
          page.should have_css('span.label', :text => 'Character:')
          page.should have_content('Docile, playful, and obedient')
        end
        within('li.size') do
          page.should have_css('span.label', :text => 'Size:')
          page.should have_content('Medium')
        end
        within('li.description') do
          page.should have_css('span.label', :text => 'Description:')
          page.should have_content(lorem)
        end
      end
    end
  end
  
  context "Guests" do
    background do
      load_master_tables
    end
    
    scenario "can't register a new pet" do
      visit homepage
      click_link('Add a new pet')
      page.should have_content('You need to sign in or sign up before continuing.')
      page.should have_no_css('h1', :text => 'New pet')
      page.should have_no_css('form#new_pet')
    end
    
    scenario "can't edit an existing pet" do
      Pet.make(:address => Address.make)
      visit homepage
      find_link('Wadus').click
      page.should have_no_content('Edit')
      
    end
  end


end