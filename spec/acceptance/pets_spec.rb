require File.dirname(__FILE__) + '/acceptance_helper'

feature "Pets", %q{
  In order to allow pets adoption
  As a user
  I want to manage pets
} do

  context "Signed in user" do
    background do
      create_and_sign_in_user
    end

    scenario 'can register new pet' do
      
    end
  end


end