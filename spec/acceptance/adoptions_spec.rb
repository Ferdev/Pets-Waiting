# encoding: UTF-8
require File.dirname(__FILE__) + '/acceptance_helper'

feature "Adoptions", %q{
  In order to allow adoptions
  As a user
  I want to adopt pets and manage adoptions
} do

  context "Users" do
    background do
      create_and_sign_in_user
      create_pets
    end

    scenario "can adopt pets" do
      visit homepage
      click_link('Know it better')
      click_link('Adopt Scroophy59!')
      page.should have_content('Adopt Scroophy59')
      page.should have_content('Interested in adopting Scroophy59?')
      page.should have_content('Write your reasons to adopt it and your experience with animals.')
      page.should have_content("Wadus, the actual Scroophy59's owner will contact you to inform about the adoption process.")
      fill_in('Reasons to adopt it', :with => lorem)
      click_button('Send Request')
      page.should have_content('Your adoption request has been submitted successfully to Wadus.')
    end

    scenario 'can mark their pets as adopted and then can unmark them' do
      visit homepage
      click_link('My pets')
      page.should have_css('ul.pets li.pet', :count => 20)
      within('ul.pets li.pet:first-child') do
        assert_difference "Adoption.count", 1 do
          click_button('Adopted pet!')
        end
      end
      within('ul.pets li.pet:first-child') do
        page.should have_css('input.adopted.active', :value => 'Adopted pet!')
        click_button('Adopted pet!')
      end
      within('ul.pets li.pet:first-child') do
        page.should have_no_css('input.adopted.active', :value => 'Adopted pet!')
      end
      click_link('Adoption requests')
      within('ul.adoptions li:first-child a') do
        page.should have_css('span.external_adoption', :text => 'External adoption')
      end
    end
  end

  context "Pending adoptions" do
    background do
      create_and_sign_in_user
      create_adoption_request
    end

    scenario "can be accepted by owners" do
      visit homepage
      click_link('My profile')
      click_link('Received adoption requests')
      page.should have_css('ul.adoptions li a span.not_adopted')
      click_link('Wadus')
      page.should have_css('ul.adoption_request li.adopt_it form input')
      page.should have_no_css('ul.adoption_request li.adopt_it form input.active')
      click_button('Adopted')
      page.should have_content('Your pet has been marked as adopted successfully.')
      page.should have_css('ul.adoption_request li.adopt_it form input.active')
      click_link('Received adoption requests')
      page.should have_css('ul.adoptions li a span.adopted')
    end

    scenario "can be deleted by owners" do
      visit homepage
      click_link('My profile')
      click_link('Received adoption requests')
      page.should have_css('ul.adoptions li', :count => 1)
      click_link('Wadus')
      page.should have_css('ul.adoption_request li.delete input.button')
      click_button('Delete Adoption Request')
      page.should have_content('Adoption request deleted successfully.')
      page.should have_no_css('ul.adoptions li')
    end
  end

end