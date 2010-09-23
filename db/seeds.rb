################################
#         TRANSLATIONS         #
################################
#
# Sexes
#

male = Sex.new
male.add_translation('es', :name => 'Macho')
male.add_translation('en', :name => 'Male')

female = Sex.new
female.add_translation('es', :name => 'Hembra')
female.add_translation('en', :name => 'Female')

#
# Sizes
#

huge = Size.new
huge.add_translation('es', :name => 'Enorme')
huge.add_translation('en', :name => 'Huge')    

big = Size.new
big.add_translation('es', :name => 'Grande')
big.add_translation('en', :name => 'Big')

medium = Size.new
medium.add_translation('es', :name => 'Mediano')
medium.add_translation('en', :name => 'Medium')

small = Size.new
small.add_translation('es', :name => 'Pequeño')
small.add_translation('en', :name => 'Small')

tiny = Size.new
tiny.add_translation('es', :name => 'Enano')
tiny.add_translation('en', :name => 'Tiny')

#
# Animals
#

dog = Animal.new
dog.add_translation('es', :name => 'Perro')
dog.add_translation('en', :name => 'Dog')

cat = Animal.new
cat.add_translation('es', :name => 'Gato')
cat.add_translation('en', :name => 'Cat')

bird = Animal.new
bird.add_translation('es', :name => 'Ave')
bird.add_translation('en', :name => 'Bird')

rodent = Animal.new
rodent.add_translation('es', :name => 'Pequeños mamíferos')
rodent.add_translation('en', :name => 'Little mammals')

reptile = Animal.new
reptile.add_translation('es', :name => 'Reptil')
reptile.add_translation('en', :name => 'Reptile')

other = Animal.new
other.add_translation('es', :name => 'Otra especie')
other.add_translation('en', :name => 'Other species')

# 
# Breeds
# 
# Dogs
dog = Animal.find(1)

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Mestizo')
breed.add_translation('en', :name => 'Crossbreed')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Akita Inu')
breed.add_translation('en', :name => 'Akita Inu')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Alaskan Malamute')
breed.add_translation('en', :name => 'Alaskan Malamute')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Basset Hound')
breed.add_translation('en', :name => 'Basset Hound')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Beagle')
breed.add_translation('en', :name => 'Beagle')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Beauceron')
breed.add_translation('en', :name => 'Beauceron')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Bichón Maltés')
breed.add_translation('en', :name => 'Maltese')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Bobtail')
breed.add_translation('en', :name => 'Bobtail')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Border Collie')
breed.add_translation('en', :name => 'Border Collie')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Boxer')
breed.add_translation('en', :name => 'Boxer')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Boyero de Berna')
breed.add_translation('en', :name => 'Bernese Mountain Dog')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Braco Alemán')
breed.add_translation('en', :name => 'German Shorthaired Pointer')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Bull Terrier')
breed.add_translation('en', :name => 'Bull Terrier')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Bulldog')
breed.add_translation('en', :name => 'Bulldog')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Caniche')
breed.add_translation('en', :name => 'Poodle')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Chihuahua')
breed.add_translation('en', :name => 'Chihuahua')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Chow Chow')
breed.add_translation('en', :name => 'Chow Chow')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Cocker Spaniel')
breed.add_translation('en', :name => 'Cocker Spaniel')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Collie')
breed.add_translation('en', :name => 'Collie')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Dálmata')
breed.add_translation('en', :name => 'Dalmatian')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Doberman')
breed.add_translation('en', :name => 'Doberman')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Dogo Argentino')
breed.add_translation('en', :name => 'Dogo Argentino')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Epagneul Bretón')
breed.add_translation('en', :name => 'Brittany Spaniel')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Fox Terrier')
breed.add_translation('en', :name => 'Fox Terrier')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Galgo Español')
breed.add_translation('en', :name => 'Galgo Spanish Greyhound')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Golden Retriever')
breed.add_translation('en', :name => 'Golden Retriever')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Gordon Setter')
breed.add_translation('en', :name => 'Gordon Setter')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Gran Danés')
breed.add_translation('en', :name => 'Great Dane')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Husky Siberiano')
breed.add_translation('en', :name => 'Siberian Husky')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Labrador Retriever')
breed.add_translation('en', :name => 'Labrador Retriever')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Mastiff')
breed.add_translation('en', :name => 'Mastiff')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Mastín de los Pirineos')
breed.add_translation('en', :name => 'Pyrenees dog')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Pastor Alemán')
breed.add_translation('en', :name => 'German Shepherd')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Pastor Australiano')
breed.add_translation('en', :name => 'Australian Shepherd')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Pastor Belga')
breed.add_translation('en', :name => 'Belgian Shepherd')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Pekinés')
breed.add_translation('en', :name => 'Pekingese')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Pinscher miniatura')
breed.add_translation('en', :name => 'Miniature Pinscher')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Pit Bull')
breed.add_translation('en', :name => 'Pit Bull')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Pug')
breed.add_translation('en', :name => 'Pug')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Rottweiler')
breed.add_translation('en', :name => 'Rottweiler')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Samoyedo')
breed.add_translation('en', :name => 'Samoyed')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'San Bernardo')
breed.add_translation('en', :name => 'Saint Bernard')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Schnauzer')
breed.add_translation('en', :name => 'Schnauzer')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Setter Inglés')
breed.add_translation('en', :name => 'English Setter')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Setter Irlandés')
breed.add_translation('en', :name => 'Irish Setter')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Shar Pei')
breed.add_translation('en', :name => 'Shar Pei')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Shih Tzu')
breed.add_translation('en', :name => 'Shih Tzu')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Teckel')
breed.add_translation('en', :name => 'Teckel')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Terranova')
breed.add_translation('en', :name => 'Newfoundland Dog')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Westie')
breed.add_translation('en', :name => 'Westie')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Yorkshire Terrier')
breed.add_translation('en', :name => 'Yorkshire Terrier')

breed = Breed.new
breed.animal = dog
breed.add_translation('es', :name => 'Otro')
breed.add_translation('en', :name => 'Other')

# Cats
cat = Animal.find(2)

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Doméstico')
breed.add_translation('en', :name => 'Domestic')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Abisinio')
breed.add_translation('en', :name => 'Abyssinian')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Angora Turco')
breed.add_translation('en', :name => 'Turkish Angora')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Azul Ruso')
breed.add_translation('en', :name => 'Russian Blue')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Balinés')
breed.add_translation('en', :name => 'Balinese')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Bengal')
breed.add_translation('en', :name => 'Bengal')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Bobtail Japonés')
breed.add_translation('en', :name => 'Japanese Bobtail')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Bombay')
breed.add_translation('en', :name => 'Bombay')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Bosque de Noruega')
breed.add_translation('en', :name => 'Norwegian Forest Cat')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Británico')
breed.add_translation('en', :name => 'British')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Chartreux')
breed.add_translation('en', :name => 'Chartreux')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Cornish Rex')
breed.add_translation('en', :name => 'Cornish Rex')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Curl Americano')
breed.add_translation('en', :name => 'American Curl')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Cymric')
breed.add_translation('en', :name => 'Cymric')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Burmés')
breed.add_translation('en', :name => 'Burmese')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Esfinge')
breed.add_translation('en', :name => 'Sphynx')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Exótico')
breed.add_translation('en', :name => 'Exotic')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Fold Escocés')
breed.add_translation('en', :name => 'Scottish Fold')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Himalayo')
breed.add_translation('en', :name => 'Himalayan')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Javanés')
breed.add_translation('en', :name => 'Javanese')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Korat')
breed.add_translation('en', :name => 'Korat')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Maine Coon')
breed.add_translation('en', :name => 'Maine Coon')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Manx')
breed.add_translation('en', :name => 'Manx')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Mau Egipcio')
breed.add_translation('en', :name => 'Egyptian Mau')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Munchkin')
breed.add_translation('en', :name => 'Munchkin')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Nebelung')
breed.add_translation('en', :name => 'Nebelung')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Ocicat')
breed.add_translation('en', :name => 'Ocicat')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Oriental')
breed.add_translation('en', :name => 'Oriental')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Pelicorto Americano')
breed.add_translation('en', :name => 'American Shortair')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Persa')
breed.add_translation('en', :name => 'Persian')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Pixie Bob')
breed.add_translation('en', :name => 'Pixie Bob')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Ragdoll')
breed.add_translation('en', :name => 'Ragdoll')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Rex')
breed.add_translation('en', :name => 'Rex')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Sagrado de Birmania')
breed.add_translation('en', :name => 'Birman')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Siamés')
breed.add_translation('en', :name => 'Siamese')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Singapur')
breed.add_translation('en', :name => 'Singapura')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Skogkatt')
breed.add_translation('en', :name => 'Skogkatt')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Snowshoe')
breed.add_translation('en', :name => 'Snowshoe')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Somalí')
breed.add_translation('en', :name => 'Somali')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Tonquinés')
breed.add_translation('en', :name => 'Tonkinese')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Van Turco')
breed.add_translation('en', :name => 'Turkish Van')

breed = Breed.new
breed.animal = cat
breed.add_translation('es', :name => 'Otro')
breed.add_translation('en', :name => 'Other')

# Birds
bird = Animal.find(3)

breed = Breed.new
breed.animal = bird
breed.add_translation('es', :name => 'Loro')
breed.add_translation('en', :name => 'Parrot')

breed = Breed.new
breed.animal = bird
breed.add_translation('es', :name => 'Periquito')
breed.add_translation('en', :name => 'Budgerigar')

breed = Breed.new
breed.animal = bird
breed.add_translation('es', :name => 'Canario')
breed.add_translation('en', :name => 'Canary')

breed = Breed.new
breed.animal = bird
breed.add_translation('es', :name => 'Paloma')
breed.add_translation('en', :name => 'Pigeon')

breed = Breed.new
breed.animal = bird
breed.add_translation('es', :name => 'Ave Rapaz')
breed.add_translation('en', :name => 'Bird of Prey')

breed = Breed.new
breed.animal = bird
breed.add_translation('es', :name => 'Otro')
breed.add_translation('en', :name => 'Other')

# Rodents
mammal = Animal.find(4)

breed = Breed.new
breed.animal = mammal
breed.add_translation('es', :name => 'Hamster')
breed.add_translation('en', :name => 'Hamster')

breed = Breed.new
breed.animal = mammal
breed.add_translation('es', :name => 'Conejo')
breed.add_translation('en', :name => 'Rabbit')

breed = Breed.new
breed.animal = mammal
breed.add_translation('es', :name => 'Cobaya')
breed.add_translation('en', :name => 'Guinea Pig')

breed = Breed.new
breed.animal = mammal
breed.add_translation('es', :name => 'Ardilla')
breed.add_translation('en', :name => 'Squirrel')

breed = Breed.new
breed.animal = mammal
breed.add_translation('es', :name => 'Jerbo')
breed.add_translation('en', :name => 'Gerbil')

breed = Breed.new
breed.animal = mammal
breed.add_translation('es', :name => 'Chinchilla')
breed.add_translation('en', :name => 'Chinchilla')

breed = Breed.new
breed.animal = mammal
breed.add_translation('es', :name => 'Ratón')
breed.add_translation('en', :name => 'Mouse')

breed = Breed.new
breed.animal = mammal
breed.add_translation('es', :name => 'Rata')
breed.add_translation('en', :name => 'Rat')

breed = Breed.new
breed.animal = mammal
breed.add_translation('es', :name => 'Hurón')
breed.add_translation('en', :name => 'Ferret')

breed = Breed.new
breed.animal = mammal
breed.add_translation('es', :name => 'Erizo')
breed.add_translation('en', :name => 'Hedgehog')

breed = Breed.new
breed.animal = mammal
breed.add_translation('es', :name => 'Otro')
breed.add_translation('en', :name => 'Other')

# Reptiles
reptile = Animal.find(5)

breed = Breed.new
breed.animal = reptile
breed.add_translation('es', :name => 'Tortuga')
breed.add_translation('en', :name => 'Turtle')

breed = Breed.new
breed.animal = reptile
breed.add_translation('es', :name => 'Iguana')
breed.add_translation('en', :name => 'Iguana')

breed = Breed.new
breed.animal = reptile
breed.add_translation('es', :name => 'Serpiente')
breed.add_translation('en', :name => 'Snake')

breed = Breed.new
breed.animal = reptile
breed.add_translation('es', :name => 'Camaleón')
breed.add_translation('en', :name => 'Chameleon')

breed = Breed.new
breed.animal = reptile
breed.add_translation('es', :name => 'Lagarto')
breed.add_translation('en', :name => 'Lizzard')

breed = Breed.new
breed.animal = reptile
breed.add_translation('es', :name => 'Gecko')
breed.add_translation('en', :name => 'Gecko')

breed = Breed.new
breed.animal = reptile
breed.add_translation('es', :name => 'Otro')
breed.add_translation('en', :name => 'Other')

# Others
other = Animal.find(6)
breed = Breed.new
breed.animal = other
breed.add_translation('es', :name => 'Arácnido')
breed.add_translation('en', :name => 'Arachnid')

breed = Breed.new
breed.animal = other
breed.add_translation('es', :name => 'Insecto')
breed.add_translation('en', :name => 'Insect')

breed = Breed.new
breed.animal = other
breed.add_translation('es', :name => 'Otro')
breed.add_translation('en', :name => 'Other')

################################
#          TEST-DATA           #
################################

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