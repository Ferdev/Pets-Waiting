# encoding: UTF-8
require File.dirname(__FILE__) + '/acceptance_helper'

feature "Images upload", %q{
  In order to promote pets
  As a user
  I want to upload and see photos of pets
} do

  include PhotosSpecHelper

  context "Signed in user with no photos uploaded", :js => true do
    background do
      load_master_tables
      create_and_sign_in_user
      create_pet
    end

    scenario "can upload photos of his registered pets" do
      visit homepage
      click_link('Wadus')
      click_link("Add a Wadus's photo")
      page.should have_content("Add a Wadus's photo")
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
      page.should have_content("Wadus's photos")
    end
  end

  context "Signed in user with one photo uploaded" do
    background do
      load_master_tables
      create_and_sign_in_user
      create_pet
      create_photo_with_thumbnail
    end

    scenario "can delete previously uploaded photos" do
      visit homepage
      click_link('Wadus')
      click_link("Manage Wadus's photos")
      page.should have_content("Wadus's photos")
      page.should have_css('ul.photos li img')
      find('ul.photos li img')[:src].should match(/uploads\/photo\/image\/\d*\/thumb_dog1\.jpg.*/)

      assert_difference "Photo.count", -1 do
        click_link('Delete photo')
      end
      page.should have_no_css('ul.photos li img')
    end
  end

  context "Signed in user with one photo uploaded (without thumbnail)", :js => true do
    background do
      load_master_tables
      create_and_sign_in_user
      create_pet
      create_photo
    end

    scenario "should see a link to generate thumbnail" do
      visit homepage
      click_link('Wadus')
      click_link("Manage Wadus's photos")
      page.should have_content("Wadus's photos")
      within('ul.photos li') do
        page.should have_css('img')
        find('img')[:src].should match(/uploads\/photo\/image\/\d*\/thumb_dog1\.jpg.*/)
        click_link('Generate thumbnail')
      end
      page.execute_script('$.pw.pets.photos.form.jcrop.setSelect([50, 50, 250, 250]);')
      click_button('Update Photo')
      page.should have_css('ul.photos li img')
      page.should have_no_content('Generate thumbnail')
    end
  end

  context "Everybody" do
    background do
      load_master_tables
      create_pet
      create_photo
    end

    scenario "can see pet's thumbnail on main pets list" do
      visit homepage
      within('.pets.results ul li.pet a') do
        page.should have_css('img')
        find('img')[:src].should match(/uploads\/photo\/image\/\d*\/thumb_dog1\.jpg.*/)
      end
    end
  end

  context "Everybody", :js => true do
    background do
      load_master_tables
      create_pet
    end

    scenario "can can read a text saying that pet has no photos when a pet doesn't have photos" do
      visit homepage
      click_link('Wadus')
      page.should have_content("There's no Wadus's photos")
    end
  end

end