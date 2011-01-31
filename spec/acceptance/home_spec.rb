# encoding: UTF-8
require File.dirname(__FILE__) + '/acceptance_helper'

feature "Home page", %q{
  In order to adopt pets
  as a user
  I want to see a list of pets
} do

  context "Users" do
    background do
      load_master_tables
      create_pets
    end

    scenario 'can see a layout, a list of page and filters' do
      visit homepage

      within('header') do
        page.should have_css('.language')
        page.should have_css('a.logo', :href => "http://#{Capybara.default_host}")
        page.should have_content('96 pets waiting for you')
      end
      page.should have_css('.announcement', :text => "\nHere you will be able to find pets that are looking for a family. \nAll are free, and all could be a perfect present for you.\n")
      within('#content') do
        within('.filters') do
          page.should have_css('.all.active',      :text => 'All')
          page.should have_css('.dogs',     :text => 'Dogs')
          page.should have_css('.cats',     :text => 'Cats')
          page.should have_css('.birds',    :text => 'Birds')
          page.should have_css('.little',   :text => 'Little pets')
          page.should have_css('.reptiles', :text => 'Reptiles')
          page.should have_css('.others',   :text => 'Others')
        end

        page.should have_css('.add_pet', :text => 'Add one pet')
        page.should have_css('.pets li', :count => 20)
      end
      within('footer') do
        page.should have_css('.pets_left', :text => '96 animals waiting')
        page.should have_css('.adoptions_done', :text => '0 adoptions done')
        page.should have_css('.logo.small')
        page.should have_css('.disclaimer', :text => 'PetsWaiting is a web page with no profit motive in mind, whose main motivation is to promote pets adoption, instead of pets sale.')
        page.should have_link('Colaborate with us')
        page.should have_link('Learn more')
        page.should have_link('Contact us')
      end
    end
  end

end