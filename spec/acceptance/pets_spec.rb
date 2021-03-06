# encoding: UTF-8
require File.dirname(__FILE__) + '/acceptance_helper'

feature "Pets", %q{
  In order to allow pets adoption
  As a user
  I want to create, update and delete pets
} do

  context "Signed in users (with javascript enabled)", :js => true do
    background do
      load_master_tables
      create_and_sign_in_user
    end

    scenario 'can register a new pet' do
      visit homepage
      # Pet data
      click_link('Add a new pet')
      fill_in("Pet's name", :with => 'Scroophy')
      select('Dog', :from => 'Kind of animal')
      select('Crossbred', :from => 'Breed')
      select('Male', :from => 'Sex')
      should_fill_address_fields
      select(4.years.ago.strftime("%Y") , :from => 'Year')
      select(4.years.ago.strftime("%B") , :from => 'Month')
      select(4.years.ago.strftime("%d").to_i.to_s , :from => 'Day')
      check('Urgent adoption')
      check('Sterilized')
      check('Vaccinated and dewormed')
      check('Canine leishmaniasis')
      check('Canine filariasis')
      check('Canine ehrlichiosis')
      check('Docile')
      check('Playful')
      check('Obedient')
      select('Medium', :from => 'Size')
      fill_in('Description', :with => lorem)
      assert_difference "Pet.count", 1 do
        click_button('Save Pet')
        page.should have_content('The pet was successfully saved.')
      end
      # Photo upload
      page.should have_content("Add a Scroophy's photo")
      attach_file('photo_image', image_to_upload)
      assert_difference "Photo.count", 1 do
        click_button('Save Photo')
      end
      page.should have_content('The photo was successfully saved.')
      page.should have_content("Add a thumbnail to the photo")
      page.should have_css('#photo')
      page.should have_css('#thumbnail')
      page.execute_script('$.pw.pets.photos.form.jcrop.setSelect([50, 50, 250, 250]);')
      find('#photo_crop_x').value.should eq('50')
      find('#photo_crop_y').value.should eq('50')
      find('#photo_crop_w').value.should eq('200')
      find('#photo_crop_h').value.should eq('200')
      click_button('Update Photo')
      page.should have_content("Scroophy's photos")
    end

    scenario 'must provide name, kind of animal, breed, address and birthday fields to add a new pet' do
      visit homepage
      click_link('Add a new pet')
      assert_difference "Pet.count", 0 do
        click_button('Save Pet')
        page.should have_css('#pet_name_input.required.error p', :text => "can't be blank")
        page.should have_css('#pet_animal_input.required.error p', :text => "can't be blank")
        page.should have_css('#pet_breed_input.required.error p', :text => "can't be blank")
        page.should have_css('#pet_sex_input.required.error p', :text => "can't be blank")
        page.should have_css('#pet_address_attributes_address_input.required.error p', :text => "can't be blank")
        page.should have_css('#pet_birthday_input.required.error p', :text => "can't be blank")
      end
    end

    scenario 'can edit a previously created pet' do
      create_pet
      visit homepage
      click_link('Wadus')
      click_link('Edit')
      # Since breed depends on kind of animal, we check if the breed combo is populated right
      page.should have_css('#pet_breed_id option[selected]', :text => 'Crossbred')
      fill_in("Pet's name", :with => 'Scooby')
      click_button('Update Pet')
      page.should have_css('ul.pet.detail li.name', :text => 'Scooby')
    end
  end

  context "Signed in users" do
    background do
      load_master_tables
      create_and_sign_in_user
      create_pets
    end

    scenario 'can manage their uploaded pets' do
      visit homepage
      page.should have_css('.admin ul li.selected', :text => 'My profile')
      page.should have_no_css('.admin ul li.selected', :text => 'My pets')
      page.should have_no_css('.admin ul li.selected', :text => 'Adoption requests')
      click_link('My pets')
      page.should have_css('.pets.results ul li.pet', :count => 32)
      within('.pets.results ul li.pet:first-child') do
        page.should have_css('a span.name', :text => 'Scroophy95')
        page.should have_css('input.adopted', :value => 'Adopted pet!')
        page.should have_css('a.delete', :text => 'Delete pet')
      end
    end

    scenario 'can delete their uploaded pets' do
      visit homepage
      click_link('My pets')
      page.should have_css('.pets.results ul li.pet', :count => 32)
      within('.pets.results ul li.pet:first-child') do
        assert_difference "Pet.count", -1 do
          click_link('Delete pet')
        end
      end
      page.should have_no_css('.pets.results ul li.pet:first-child a span.name', :text => 'Scroophy95')
    end

  end

  context "Everyone (with javascript enabled)", :js => true do
    background do
      load_master_tables
      create_pets
      create_pet
    end

    scenario "can see a list of pets" do
      visit homepage
      page.should have_css('.pets.filters')
      page.should have_css('.pets.results ul li.pet', :count => 32)
      page.should have_no_css('.pets.results .pagination')
      within('.pets.results ul li.pet:first-child') do
        page.should have_css('span.name', :text => 'Wadus')
        page.should have_css('span.animal', :text => 'Kind of animal: Dog')
        page.should have_css('span.breed', :text => "Breed: Crossbred")
        page.should have_css('span.sex', :text => "Sex: Male")
        page.should have_css('span.age', :text => "Age: about 4 years")
        page.should have_css('span.place', :text => "Place: Calle de Torrelavega, 62, 28140 Fuente el Saz de Jarama, Spain")
        page.should have_css('span.urgent', :text => "Urgent adoption")
      end
      scroll_all_page_down
      page.should have_css('.pets.results ul li.loading')
      page.should have_css('.pets.results ul li.pet', :count => 64)
      page.should have_no_css('.pets.results ul li.loading')
      page.should have_css('.pets.results ul li.pet:last-child a span.name', :text => 'Scroophy33')
      scroll_all_page_down
      page.should have_css('.pets.results ul li.loading')
      page.should have_css('.pets.results ul li.pet', :count => 96)
      page.should have_no_css('.pets.results ul li.loading')
      page.should have_css('.pets.results ul li.pet:last-child a span.name', :text => 'Scroophy1')
    end

    scenario "can filter pet's list by species" do
      visit homepage
      click_link('Dogs')
      page.should have_css('.pets.results ul li.pet')
      page.should have_css('.pets.filters ul li.dogs a.button.active')
      page.should have_css('.pets.results ul li.pet.dog')
      page.should have_no_css('.pets.results ul li.pet.cat')
      click_link('Cats')
      page.should have_css('.pets.filters ul li.dogs a.button.active')
      page.should have_css('.pets.filters ul li.cats a.button.active')
      page.should have_css('.pets.results ul li.pet.dog')
      page.should have_css('.pets.results ul li.pet.cat')
      click_link('Cats')
      page.should have_css('.pets.filters ul li.dogs a.button.active')
      page.should have_no_css('.pets.filters ul li.cats a.button.active')
      page.should have_css('.pets.results ul li.pet.dog')
      page.should have_no_css('.pets.results ul li.pet.cat')
      click_link('Urgents')
      page.should have_css('.pets.filters ul li.dogs a.button.active')
      page.should have_no_css('.pets.filters ul li.cats a.button.active')
      page.should have_css('.pets.results ul li.pet.dog')
      page.should have_no_css('.pets.results ul li.pet.cat')
      all('.pets.results ul li.pet a.data').each do |a|
        a.text.should match(/Urgent adoption/)
      end
      click_link('Males')
      page.should have_css('.pets.filters ul li.urgents a.button.active')
      page.should have_css('.pets.filters ul li.dogs a.button.active')
      page.should have_no_css('.pets.filters ul li.cats a.button.active')
      page.should have_css('.pets.filters ul li.males a.button.active')
      page.should have_css('.pets.results ul li.pet.dog')
      page.should have_no_css('.pets.results ul li.pet.cat')
      all('.pets.results ul li.pet a.data').each do |a|
        a.text.should match(/Urgent adoption/)
      end
      all('.pets.results ul li.pet a.data').each do |a|
        a.text.should match(/Male/)
      end
    end

  end

  context "Everyone" do
    background do
      load_master_tables
      create_pets
      create_pet
    end

    scenario "can see a list of pets" do
      visit homepage
      page.should have_css('.pets.filters')
      page.should have_css('.pets.results ul li.pet', :count => 32)
      page.should have_css('.pets.results .pagination')
      within('.pets.results ul li.pet:first-child') do
        page.should have_css('span.name', :text => 'Wadus')
        page.should have_css('span.animal', :text => "\nKind of animal:\nDog\n")
        page.should have_css('span.breed', :text => "\nBreed:\nCrossbred\n")
        page.should have_css('span.sex', :text => "\nSex:\nMale\n")
        page.should have_css('span.age', :text => "\nAge:\nabout 4 years\n")
        page.should have_css('span.place', :text => "\nPlace:\nCalle de Torrelavega, 62, 28140 Fuente el Saz de Jarama, Spain\n")
        page.should have_css('span.urgent', :text => "Urgent adoption")
      end
      click_link('2')
      page.should have_css('.pets.results ul li.pet', :count => 32)
      page.should have_css('.pets.results ul li.pet:first-child a span.name', :text => 'Scroophy64')
      page.should have_css('.pets.results ul li.pet:last-child a span.name', :text => 'Scroophy33')
    end

    scenario "can see a pet's detail" do
      visit homepage
      click_link('Wadus')
      within('ul.pet.detail') do
        within('li.name') do
          page.should have_content('Wadus')
        end
        within('li.photos') do
          page.should have_css('span.no_photos', :text => 'There\'s no Wadus\'s photos')
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
        within('li.sex') do
          page.should have_css('span.label', :text => 'Sex:')
          page.should have_content('Male')
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
          all('ul li')[0].text.should eq('Docile')
          all('ul li')[1].text.should eq('Playful')
          all('ul li')[2].text.should eq('Obedient')
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

    scenario "can filter pet's list by species, urgency or sex" do
      visit homepage
      click_link('Dogs')
      page.should have_css('.pets.filters ul li.dogs a.button.active')
      page.should have_css('.pets.results ul li.pet.dog')
      page.should have_no_css('.pets.results ul li.pet.cat')
      click_link('Cats')
      page.should have_css('.pets.filters ul li.dogs a.button.active')
      page.should have_css('.pets.filters ul li.cats a.button.active')
      page.should have_css('.pets.results ul li.pet.dog')
      page.should have_css('.pets.results ul li.pet.cat')
      click_link('Cats')
      page.should have_css('.pets.filters ul li.dogs a.button.active')
      page.should have_no_css('.pets.filters ul li.cats a.button.active')
      page.should have_css('.pets.results ul li.pet.dog')
      page.should have_no_css('.pets.results ul li.pet.cat')
      click_link('Urgents')
      page.should have_css('.pets.filters ul li.urgents a.button.active')
      page.should have_css('.pets.filters ul li.dogs a.button.active')
      page.should have_no_css('.pets.filters ul li.cats a.button.active')
      page.should have_css('.pets.results ul li.pet.dog')
      page.should have_no_css('.pets.results ul li.pet.cat')
      all('.pets.results ul li.pet a.data').each do |a|
        a.text.should match(/Urgent adoption/)
      end
      click_link('Males')
      page.should have_css('.pets.filters ul li.urgents a.button.active')
      page.should have_css('.pets.filters ul li.dogs a.button.active')
      page.should have_no_css('.pets.filters ul li.cats a.button.active')
      page.should have_css('.pets.filters ul li.males a.button.active')
      page.should have_css('.pets.results ul li.pet.dog')
      page.should have_no_css('.pets.results ul li.pet.cat')
      all('.pets.results ul li.pet a.data').each do |a|
        a.text.should match(/Urgent adoption/)
      end
      all('.pets.results ul li.pet a.data').each do |a|
        a.text.should match(/Male/)
      end
    end

  end

  context "Guests" do
    background do
      load_master_tables
      create_pets
    end

    scenario "can't register a new pet" do
      visit homepage
      click_link('Add a new pet')
      page.should have_content('You need to sign in or sign up before continuing.')
      page.should have_no_css('h1', :text => 'New pet')
      page.should have_no_css('form#new_pet')
    end

    scenario "can't edit an existing pet" do
      visit homepage
      click_link('Scroophy95')
      page.should have_no_content('Edit')
    end
  end

end