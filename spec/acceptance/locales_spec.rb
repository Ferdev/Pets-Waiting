# encoding: UTF-8
require File.dirname(__FILE__) + '/acceptance_helper'

feature "Locales", %q{
  In order understand the web
  As a user
  I want to be able to switch page\'s language
} do

  context "Signed in users" do
    background do
      sign_in_user
    end

    scenario "can change page's language" do
      visit homepage
      page.should have_content('Tons of pets are waiting for you!')
      click_link('Español')
      page.should have_content('¡Un montón de mascotas están esperándote!')
      User.first.locale.should == 'es'
    end
  end

  context "Guests" do
    scenario "can change page's language and it is stored into a cookie" do
      visit homepage
      page.should have_content('Tons of pets are waiting for you!')
      click_link('Español')
      page.should have_content('¡Un montón de mascotas están esperándote!')
      # We visit again the homepage and since our last language selection
      # is stored in a cookie, it should remember it
      visit homepage
      page.should have_content('¡Un montón de mascotas están esperándote!')
    end
  end

end