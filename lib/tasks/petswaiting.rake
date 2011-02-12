# encoding: UTF-8
namespace :petswaiting do

  desc "Adds testing data"
  task :test_data => :environment do
    if Rails.env != 'production'
      puts '##########################################'
      puts 'Destroying previously created uses...'
      User.destroy_all
      puts '... done!'
      puts '##########################################'
      puts 'Destroying previously created pets...'
      Pet.destroy_all
      puts '... done!'
      puts '##########################################'

      user = User.new
      user.name                  = 'Fer'
      user.email                 = 'fer@ferdev.com'
      user.password              = 'waduswadus'
      user.password_confirmation = 'waduswadus'
      user.phone_number          = '666554433'
      address                    = Address.create(:address => 'Madrid, Spain')
      user.address               = address
      user.save!

      john_doe = User.new
      john_doe.name                  = 'John Doe'
      john_doe.email                 = 'john@doe.com'
      john_doe.password              = 'waduswadus'
      john_doe.password_confirmation = 'waduswadus'
      john_doe.phone_number          = '666112233'
      john_doe_address               = Address.create(:address => 'Almuñecar, Spain')
      john_doe.address               = john_doe_address
      john_doe.save!

      breeds                = Breed.all
      sexes                 = Sex.all
      photos                = random_pet_photos
      description_generator = Faker::MetalIpsum.new

      100.times do |i|
        breed = breeds.sample

        name = "Scroophy#{i}"
        puts "Saving #{name}..."

        pet = Pet.new({
          :name => name,
          :birthday => (1..10).to_a.sample.years.ago
        })
        pet.user        = user
        pet.animal      = breed.animal
        pet.breed       = breed
        pet.address     = address.clone
        pet.sex         = sexes.sample
        pet.urgent      = [true, false].sample
        pet.description = "#{description_generator.paragraph}\n\n#{description_generator.paragraph}"
        # Mark as true three random character attributes
        random_character_keys.each{|k| pet[k] = true}

        pet.photos  = []
        3.times{ pet.photos << Photo.create(:image => photos.sample) }

        pet.save!

        user.pets << pet
        user.save!

        puts "... Done!"
      end
    end
  end
end

def random_pet_photos
  pet_photos = %w(
    dog1.jpg
    kitten1.jpeg
    kitten2.jpeg
    kitten3.jpeg
    puppy1.jpeg
    puppy2.jpeg
  ).map{|f| File.open(Rails.root.join('spec/fixtures', f))}
end

def random_character_keys(number = 4)
  keys = %w(docile calm agressive_people agressive_animals dominant affectionate independent dependent possessive playful tireless obedient disobedient trained sleepyhead friendly_people friendly_animals)
  keys.sample(number)
end
