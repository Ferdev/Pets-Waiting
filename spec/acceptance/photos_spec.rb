require File.dirname(__FILE__) + '/acceptance_helper'

feature "Images upload", %q{
  In order to promote pets
  As a user
  I want to upload photos of my pets
} do
  
  context "Signed in user with no photos uploaded" do
    background do
      enable_javascript
      load_master_tables
      create_and_sign_in_user
      create_pet
    end
    
    scenario "can upload photos of his registered pets" do
      visit homepage
      click_link('Wadus')
      click_link("Add Wadus's photos")
      page.should have_content("Wadus's photos")
      page.should have_no_css('ul.photos li img')
      click_link('Add a photo')
      attach_file('Select a photo', image_to_upload)
      assert_difference "Photo.count", 1 do
        click_button('Save Photo')
      end
      page.should have_content('The photo was successfully saved.')
      page.should have_content("Add a thumbnail to the photo")
      page.should have_css('#photo')
      page.should have_css('#thumbnail')
      page.execute_script('$.pw.pets.photos.form.ias.setSelection(50, 50, 250, 250, true);$.pw.pets.photos.form.ias.update();')
      find('#photo_crop_x').value.should eq('50')
      find('#photo_crop_y').value.should eq('50')
      find('#photo_crop_w').value.should eq('200')
      find('#photo_crop_h').value.should eq('200')
      click_button('Update Photo')
      page.should have_css('ul.photos li img')
    end
  end
  
  context "Signed in user with one photo uploaded" do
    background do
      load_master_tables
      create_and_sign_in_user
      create_pet
      create_photo
    end
    
    scenario "can delete previously uploaded photos" do
      visit homepage
      click_link('Wadus')
      click_link("Add Wadus's photos")
      page.should have_content("Wadus's photos")
      page.should have_css('ul.photos li img')
      assert_difference "Photo.count", -1 do
        click_link('Delete photo')
      end
      page.should have_no_css('ul.photos li img')
    end

  end
  
end