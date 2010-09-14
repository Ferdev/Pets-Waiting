require File.dirname(__FILE__) + '/acceptance_helper'

feature "Adoptions", %q{
  In order to have a pet
  As a user
  I want to adopt a pet
} do
  
  context "Users" do
    background do
      load_master_tables
      create_and_sign_in_user
      create_pets
    end
    
    scenario "can adopt pets" do
      visit homepage
      click_link('Scroophy0')
      click_link('Adopt Scroophy0')
      page.should have_content('Adopt Scroophy0')
      page.should have_content('Interested in adopting Scroophy0?')
      page.should have_content('Write your reasons to adopt it and your experience with animals.')
      page.should have_content("Wadus, the actual Scroophy0's owner will contact you to inform about the adoption process.")
      fill_in('Reasons to adopt it', :with => lorem)
      click_button('Send Request')
      page.should have_content('Your adoption request has been submitted successfully to Wadus.')
    end
  end

end