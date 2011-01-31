# encoding: UTF-8
namespace :petswaiting do

  desc "Adds testing data"
  task :test_data => :environment do
    if Rails.env != 'production'
      user = User.new
      user.name                  = 'Fer'
      user.email                 = 'fer@ferdev.com'
      user.password              = 'waduswadus'
      user.password_confirmation = 'waduswadus'
      user.phone_number          = '666554433'
      address = Address.create(:address => 'Madrid, Spain')
      user.address = address
      user.save
      1000.times do |i|
        breed = Breed.all.sample
        pet = Pet.new({
          :name => "Scroophy#{i}",
          :birthday => (1..10).to_a.sample.years.ago
        })
        pet.user = user
        pet.animal = breed.animal
        pet.breed = breed
        pet.address = address
        pet.sex = Sex.all.sample
        pet.save
      end
    end
  end

end