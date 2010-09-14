require File.dirname(__FILE__) + '/acceptance_helper'

feature "Users", %q{
  In order to be able to adopt and register pets
  As a user
  I want to sign up and edit my data
} do

  context "Guests (with javascript enabled)" do
    background do
      load_master_tables
      enable_javascript
    end
  
    scenario "can sign up" do
      visit homepage
      click_link('Sign up')
      fill_in('Name', :with => 'Wadus Wadus')
      fill_in('Email', :with => 'wadus@wadus.com')
      fill_in('Password', :with => 'waduswadus')
      fill_in('Password confirmation', :with => 'waduswadus')
      fill_in('Address', :with => 'Madrid, Spain')
      fill_in('Phone number', :with => '+34 667 52 16 23')
      fill_in("Association's name", :with => 'Wadus Association')
      fill_in('Web', :with => 'http://www.associationweb.com')
      assert_difference "User.count", 1 do
        click_button('Sign up')
      end
      page.should have_content('You have signed up successfully.')
    end
  end
  
  context "Guests" do
    background do
      load_master_tables
    end
    
    scenario "can sign up" do
      visit homepage
      click_link('Sign up')
      fill_in('Name', :with => 'Wadus Wadus')
      fill_in('Email', :with => 'wadus@wadus.com')
      fill_in('Password', :with => 'waduswadus')
      fill_in('Password confirmation', :with => 'waduswadus')
      fill_in('Address', :with => 'Madrid, Spain')
      fill_in('Phone number', :with => '+34 667 52 16 23')
      fill_in("Association's name", :with => 'Wadus Association')
      fill_in('Web', :with => 'http://www.associationweb.com')
      assert_difference "User.count", 1 do
        click_button('Sign up')
      end
      page.should have_content('You have signed up successfully.')
    end

    scenario "must provide a valid phone number" do
      visit homepage
      click_link('Sign up')
      fill_in('Name', :with => 'Wadus Wadus')
      fill_in('Email', :with => 'wadus@wadus.com')
      fill_in('Password', :with => 'waduswadus')
      fill_in('Password confirmation', :with => 'waduswadus')
      fill_in('Address', :with => 'Madrid, Spain')
      fill_in('Phone number', :with => 'asdf')
      fill_in("Association's name", :with => 'Wadus Association')
      fill_in('Web', :with => 'http://www.associationweb.com')
      assert_difference "User.count", 0 do
        click_button('Sign up')
      end
      page.should have_content('Phone number is invalid')
      fill_in('Phone number', :with => '+34 667 52 16 23')
      fill_in('Password', :with => 'waduswadus')
      fill_in('Password confirmation', :with => 'waduswadus')
      assert_difference "User.count", 1 do
        click_button('Sign up')
      end
      page.should have_content('You have signed up successfully.')
    end
    
    scenario "name, email, password, address and phone number can't be blank" do
      visit homepage
      click_link('Sign up')
      assert_difference "User.count", 0 do
        click_button('Sign up')
      end
      page.should have_content('Name can\'t be blank')
      page.should have_content('Email can\'t be blank')
      page.should have_content('Address can\'t be blank')
      page.should have_content('Password can\'t be blank')
      page.should have_content('Phone number can\'t be blank')
    end
  
  end
  
  context "Users" do
    background do
      load_master_tables
      create_and_sign_in_user
    end
    
    scenario "can edit their data" do
      visit homepage
      click_link('My profile')
      fill_in('Name', :with => 'Wadus Wadus')
      fill_in('Email', :with => 'wadus@wadus.com')
      fill_in('Password', :with => 'supertopsecret')
      fill_in('Password confirmation', :with => 'supertopsecret')
      fill_in('Current password', :with => 'waduswadus')
      fill_in('Address', :with => 'Madrid, Spain')
      fill_in('Phone number', :with => '+34 667 52 16 23')
      fill_in("Association's name", :with => 'Wadus Association')
      fill_in('Web', :with => 'http://www.associationweb.com')
      assert_difference "User.count", 0 do
        click_button('Edit User')
      end
      page.should have_content('You updated your account successfully.')
    end
  end
  
  context "Users (with javascript)" do
    background do
      enable_javascript
      load_master_tables
      create_and_sign_in_user
    end
    
    scenario "can edit their data" do
      visit homepage
      click_link('My profile')
      fill_in('Name', :with => 'Wadus Wadus')
      fill_in('Email', :with => 'wadus@wadus.com')
      fill_in('Password', :with => 'supertopsecret')
      fill_in('Password confirmation', :with => 'supertopsecret')
      fill_in('Current password', :with => 'waduswadus')
      fill_in('Address', :with => 'Madrid, Spain')
      fill_in('Phone number', :with => '+34 667 52 16 23')
      fill_in("Association's name", :with => 'Wadus Association')
      fill_in('Web', :with => 'http://www.associationweb.com')
      assert_difference "User.count", 0 do
        click_button('Edit User')
      end
      page.should have_content('You updated your account successfully.')
    end
  end
end