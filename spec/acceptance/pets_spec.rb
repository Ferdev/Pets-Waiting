# encoding: UTF-8
require File.dirname(__FILE__) + '/acceptance_helper'

feature "Pets", %q{
  In order to allow pets adoption
  As a user
  I want to create, update and delete pets
} do

  context "Signed in users (with javascript enabled)", :js => true do
    background do
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
      attach_file('pet_photos_attributes_0_image', random_pet_photo)
      click_link('Add another photo')
      attach_file('pet_photos_attributes_1_image', random_pet_photo)
      click_link('Add another photo')
      attach_file('pet_photos_attributes_2_image', random_pet_photo)
      click_link('Add another photo')
      attach_file('pet_photos_attributes_3_image', random_pet_photo)
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
      click_link('Know it better')
      click_link('Edit')
      # Since breed depends on kind of animal, we check if the breed combo is populated right
      page.should have_css('#pet_breed_id option[selected]', :text => 'Crossbred')
      fill_in("Pet's name", :with => 'Scooby')
      click_button('Update Pet')
      page.should have_css('ul.data li span.name', :text => 'Scooby')
    end
  end

  context "Signed in users" do
    background do
      create_and_sign_in_user
      create_pets
    end

    scenario 'can register a new pet' do
      visit homepage
      # Pet data
      click_link('Add a new pet')
      fill_in("Pet's name", :with => 'Scroophy')
      select('Dog', :from => 'Kind of animal')
      select('Crossbred', :from => 'Breed')
      select('Male', :from => 'Sex')
      fill_in('Address', :with => 'Madrid, Spain')
      select(4.years.ago.strftime("%Y") , :from => 'Year')
      select(4.years.ago.strftime("%B") , :from => 'Month')
      select(4.years.ago.strftime("%d").to_i.to_s , :from => 'Day')
      attach_file('pet_photos_attributes_0_image', random_pet_photo)
      attach_file('pet_photos_attributes_1_image', random_pet_photo)
      attach_file('pet_photos_attributes_2_image', random_pet_photo)
      attach_file('pet_photos_attributes_3_image', random_pet_photo)
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
        within('div.dog.pet.urgent') do
          page.should have_css('img.photo', :count => 4)
          within('ul.data li.name') do
            page.should have_css('span.name', :text => 'Scroophy')
            page.should have_css('span.animal_sex', :text => "a male dog.")
            page.should have_css('span.age', :text => "About 4 years")
          end
          within('ul.data li.character') do
            page.should have_css('span.label', :text => 'Character')
            page.should have_css('ul li span', :text => 'Docile')
            page.should have_css('ul li span', :text => 'Playful')
            page.should have_css('ul li span', :text => 'Obedient')
          end
          within('ul.data li.breed') do
            page.should have_css('span.label', :text => 'Breed')
            page.should have_css('span', :text => 'Crossbred')
          end
          within('ul.data li.place') do
            page.should have_css('span.label', :text => 'Place')
            page.should have_css('span', :text => 'Madrid, Spain')
          end
          within('ul.data li.adopt_it') do
            page.should have_no_link('Adopt Wadus!')
          end
          within('.description_and_location') do
            within('.description')  do
              page.should have_content lorem
            end
            within('.location')  do
              page.should have_content 'Location map'
              page.should have_css('.map img')
            end
          end
        end
      end
    end

    scenario 'can manage their uploaded pets' do
      visit homepage
      page.should have_css('.admin ul li.selected', :text => 'My profile')
      page.should have_no_css('.admin ul li.selected', :text => 'My pets')
      page.should have_no_css('.admin ul li.selected', :text => 'Adoption requests')
      click_link('My pets')
      page.should have_css('ul.pets li.pet', :count => 20)
      within('ul.pets li.pet:first-child') do
        page.should have_css('span.name', :text => 'Scroophy59')
        page.should have_css('input.adopted', :value => 'Adopted pet!')
        page.should have_css('a.delete', :text => 'Delete pet')
      end
    end

    scenario 'can delete their uploaded pets' do
      visit homepage
      click_link('My pets')
      page.should have_css('ul.pets li.pet', :count => 20)
      within('ul.pets li.pet:first-child') do
        assert_difference "Pet.count", -1 do
          click_link('Delete pet')
        end
      end
      page.should have_no_css('ul.pets li.pet:first-child a span.name', :text => 'Scroophy95')
    end

  end

  context "Everyone (with javascript enabled)", :js => true do
    background do
      create_pets
      create_pet
    end

    scenario "can see a list of pets" do
      visit homepage
      page.should have_css('.filters')
      page.should have_css('ul.pets li.pet', :count => 20)
      page.should have_no_css('ul.pets .pagination')
      within('ul.pets li.pet.urgent:first-child') do
        within('ul.data li.name') do
          page.should have_css('span.name', :text => 'Wadus')
          page.should have_css('span.animal_sex', :text => "a male dog.")
          page.should have_css('span.age', :text => "About 4 years")
        end
        within('ul.data li.character') do
          page.should have_css('span.label', :text => 'Character')
          page.should have_css('ul li span', :text => 'Docile')
          page.should have_css('ul li span', :text => 'Playful')
          page.should have_css('ul li span', :text => 'Obedient')
        end
        within('ul.data li.breed') do
          page.should have_css('span.label', :text => 'Breed')
          page.should have_css('span', :text => 'Crossbred')
        end
        within('ul.data li.place') do
          page.should have_css('span.label', :text => 'Place')
          page.should have_css('span', :text => 'Calle de Torrelavega, 62, 28140 Fuente el Saz de Jarama, Spain')
        end
        page.should have_link('Know it better')
      end
      scroll_all_page_down
      page.should have_css('ul.pets li.loading')
      page.should have_css('ul.pets li.pet', :count => 40)
      page.should have_no_css('ul.pets li.loading')
      page.should have_css('ul.pets li.pet:last-child ul.data li.name span.name', :text => 'Scroophy21')
      scroll_all_page_down
      page.should have_css('ul.pets li.loading')
      page.should have_css('ul.pets li.pet', :count => 60)
      page.should have_no_css('ul.pets li.loading')
      page.should have_css('ul.pets li.pet:last-child ul.data li.name span.name', :text => 'Scroophy1')
    end

    scenario "can filter pet's list by species" do
      visit homepage
      click_link('Dogs')
      page.should have_css('ul.pets li.pet')
      page.should have_css('ul.filters li.dogs.active a')
      page.should have_css('ul.pets li.pet.dog')
      page.should have_no_css('ul.pets li.pet.cat')
      click_link('Cats')
      page.should have_css('ul.filters li.dogs.active a')
      page.should have_css('ul.filters li.cats.active a')
      page.should have_css('ul.pets li.pet.dog')
      page.should have_css('ul.pets li.pet.cat')
      click_link('Cats')
      page.should have_css('ul.filters li.dogs.active a')
      page.should have_no_css('ul.filters li.cats.active a')
      page.should have_css('ul.pets li.pet.dog')
      page.should have_no_css('ul.pets li.pet.cat')
    end
  end

  context "Everyone" do
    background do
      create_pets
      create_pet
    end

    scenario "can see a list of pets" do
      visit homepage
      page.should have_css('.filters')
      page.should have_css('ul.pets li.pet', :count => 20)
      page.should have_css('ul.pets .pagination')
      within('ul.pets li.pet.urgent:first-child') do
        within('ul.data li.name') do
          page.should have_css('span.name', :text => 'Wadus')
          page.should have_css('span.animal_sex', :text => "a male dog.")
          page.should have_css('span.age', :text => "About 4 years")
        end
        within('ul.data li.character') do
          page.should have_css('span.label', :text => 'Character')
          page.should have_css('ul li span', :text => 'Docile')
          page.should have_css('ul li span', :text => 'Playful')
          page.should have_css('ul li span', :text => 'Obedient')
        end
        within('ul.data li.breed') do
          page.should have_css('span.label', :text => 'Breed')
          page.should have_css('span', :text => 'Crossbred')
        end
        within('ul.data li.place') do
          page.should have_css('span.label', :text => 'Place')
          page.should have_css('span', :text => 'Calle de Torrelavega, 62, 28140 Fuente el Saz de Jarama, Spain')
        end
        page.should have_link('Know it better')
      end
      click_link('2')
      page.should have_css('ul.pets li.pet', :count => 20)
      page.should have_css('ul.pets li.pet:first-child ul.data li.name span.name', :text => 'Scroophy40')
      page.should have_css('ul.pets li.pet:last-child ul.data li.name span.name', :text => 'Scroophy21')
    end

    scenario "can see a pet's detail" do
      visit homepage
      within('ul.pets li.pet:first-child') do
        click_link('Know it better')
      end

      within('div.dog.pet.urgent') do
        page.should have_css('img.photo')
        within('ul.data li.name') do
          page.should have_css('span.name', :text => 'Wadus')
          page.should have_css('span.animal_sex', :text => "a male dog.")
          page.should have_css('span.age', :text => "About 4 years")
        end
        within('ul.data li.character') do
          page.should have_css('span.label', :text => 'Character')
          page.should have_css('ul li span', :text => 'Docile')
          page.should have_css('ul li span', :text => 'Playful')
          page.should have_css('ul li span', :text => 'Obedient')
        end
        within('ul.data li.breed') do
          page.should have_css('span.label', :text => 'Breed')
          page.should have_css('span', :text => 'Crossbred')
        end
        within('ul.data li.place') do
          page.should have_css('span.label', :text => 'Place')
          page.should have_css('span', :text => 'Calle de Torrelavega, 62, 28140 Fuente el Saz de Jarama, Spain')
        end
        within('ul.data li.adopt_it') do
          page.should have_link('Adopt Wadus!')
        end
        within('.description_and_location') do
          within('.description')  do
            page.should have_content lorem
          end
          within('.location')  do
            page.should have_content 'Location map'
            page.should have_css('.map img')
          end
        end
      end
    end

    scenario "can filter pet's list by species" do
      visit homepage
      click_link('Dogs')
      page.should have_css('ul.filters li.dogs.active a')
      page.should have_css('ul.pets li.pet.dog')
      page.should have_no_css('ul.pets li.pet.cat')
      click_link('Cats')
      page.should have_css('ul.filters li.dogs.active a')
      page.should have_css('ul.filters li.cats.active a')
      page.should have_css('ul.pets li.pet.dog')
      page.should have_css('ul.pets li.pet.cat')
      click_link('Cats')
      page.should have_css('ul.filters li.dogs.active a')
      page.should have_no_css('ul.filters li.cats.active a')
      page.should have_css('ul.pets li.pet.dog')
      page.should have_no_css('ul.pets li.pet.cat')
    end

  end

  context "Guests" do
    background do
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
      within('ul.pets li.pet:first-child') do
        click_link('Know it better')
      end
      page.should have_no_content('Edit')
    end
  end

end