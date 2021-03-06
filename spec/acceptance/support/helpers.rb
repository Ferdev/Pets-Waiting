# encoding: UTF-8
module HelperMethods
  attr_accessor :current_user

  def lorem
    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
  end

  def load_master_tables
    dog           = Animal.make(:dog)
    cat           = Animal.make(:cat)
    bird          = Animal.make(:bird)
    little_mammal = Animal.make(:little_mammal)
    reptile       = Animal.make(:reptile)
    other         = Animal.make(:other_species)

    Breed.make(:animal => dog)
    Breed.make(:animal => cat)
    Breed.make(:animal => bird)
    Breed.make(:animal => little_mammal)
    Breed.make(:animal => reptile)
    Breed.make(:animal => other)

    Disease.make(:leishmaniasis, :animal => dog)
    Disease.make(:filariasis, :animal => dog)
    Disease.make(:ehrlichiosis, :animal => dog)
    Disease.make(:leukemia, :animal => cat)
    Disease.make(:immunodeficiency, :animal => cat)

    Sex.make(:male)
    Sex.make(:female)

    Size.make
    Address.make
  end

  def create_and_sign_in_user
    @current_user = User.make(:address => Address.first)
    visit homepage
    click_link('Sign in')
    fill_in('Email', :with => 'fer@ferdev.com')
    fill_in('Password', :with => 'waduswadus')
    click_button('Sign in')
    page.should have_content('Signed in successfully.')
  end

  def create_pet(attributes = {})
    breed = Animal.dog.breeds.first
    defaults = {
      :name         => 'Wadus',
      :address      => Address.make,
      :user         => @current_user,
      :animal       => breed.animal,
      :breed        => breed,
      :description  => lorem,
      :urgent       => true,
      :sex          => Sex.male
    }
    attributes = defaults.merge(attributes)
    @pet = Pet.make(attributes)
  end

  def create_pets(number = 96)
    number.times do |i|
      breed = Breed.all.sample
      create_pet({
        :name   => "Scroophy#{i}",
        :breed  => breed,
        :animal => breed.animal,
        :urgent => [true,false].sample,
        :sex    => Sex.all.sample
      })
    end
  end

  def create_adoption_request
    pet = create_pet
    Adoption.make(:pet => pet, :adoptant => User.make(:guest, :address => Address.first), :reasons => lorem)
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
    find('#pet_address_attributes_substate').value.should eq('Community of Madrid')
    find('#pet_address_attributes_city').value.should eq('Fuente el Saz de Jarama')
  end

  def image_to_upload
    File.dirname(__FILE__) + '/../../fixtures/dog1.jpg'
  end

  def create_photo(crop = nil)
    photo = Photo.make(:pet => @pet)
    photo.image = File.open(image_to_upload)
    if crop
      photo.crop_x = crop[:crop_x]
      photo.crop_y = crop[:crop_y]
      photo.crop_w = crop[:crop_w]
      photo.crop_h = crop[:crop_h]
    end
    photo.save!
  end

  def create_photo_with_thumbnail
    create_photo({:crop_x => 50, :crop_y => 50, :crop_w => 200, :crop_h => 200})
  end

  def scroll_all_page_down
    page.execute_script("$(document).scrollTop($(document).height());")
  end
end

Rspec.configuration.include(HelperMethods)
