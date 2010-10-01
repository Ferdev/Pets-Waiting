namespace :petswaiting do

  desc "Adds testing data"
  task :test_data => :environment do
    if Rails.env == 'development'
      user    = User.exists? ? User.first : User.create({
        :name =>'Fer',
        :email => 'fer@ferdev.com',
        :password => 'waduswadus',
        :password_confirmation => 'waduswadus',
        :phone_number => '666554433'
      })
      address = Address.create(:address => 'Madrid, Spain')
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