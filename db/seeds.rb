# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
if Rails.env == 'development'
  user    = User.exists? ? User.first : User.create(:email => 'wadus@wadus.com', :password => 'waduswadus', :password_confirmation => 'waduswadus')
  breed   = Breed.create(:name => 'Crossbred', :animal => Animal.create(:name => 'Dog'))
  address = Address.create(:address => 'Madrid, Spain')
  male    = Sex.create(:name => 'Male')
  female  = Sex.create(:name => 'Female')
  1000.times do |i|
    Pet.create({
      :name => "Scroophy#{i}",
      :user => user,
      :animal => breed.animal,
      :breed => breed,
      :address => address,
      :sex => [male, female].choice,
      :birthday => (1..10).to_a.choice.years.ago
    })
  end
end