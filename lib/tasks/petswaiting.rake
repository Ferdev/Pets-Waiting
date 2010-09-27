namespace :petswaiting do

  desc "Adds testing data"
  task :test_data do
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
        Pet.create({
          :name => "Scroophy#{i}",
          :user => user,
          :animal => breed.animal,
          :breed => breed,
          :address => address,
          :sex => Sex.all.sample,
          :birthday => (1..10).to_a.sample.years.ago
        })
      end
    end
  end

end