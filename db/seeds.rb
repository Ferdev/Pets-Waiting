# encoding: UTF-8

################################
#         TRANSLATIONS         #
################################
#
# Sexes
#

male = Sex.find_or_create_by_id(1)
male.add_translation('es', :name => 'Macho')
male.add_translation('en', :name => 'Male')

female = Sex.find_or_create_by_id(2)
female.add_translation('es', :name => 'Hembra')
female.add_translation('en', :name => 'Female')

#
# Sizes
#

huge = Size.find_or_create_by_id(1)
huge.add_translation('es', :name => 'Enorme')
huge.add_translation('en', :name => 'Huge')    

big = Size.find_or_create_by_id(2)
big.add_translation('es', :name => 'Grande')
big.add_translation('en', :name => 'Big')

medium = Size.find_or_create_by_id(3)
medium.add_translation('es', :name => 'Mediano')
medium.add_translation('en', :name => 'Medium')

small = Size.find_or_create_by_id(4)
small.add_translation('es', :name => 'Pequeño')
small.add_translation('en', :name => 'Small')

tiny = Size.find_or_create_by_id(5)
tiny.add_translation('es', :name => 'Enano')
tiny.add_translation('en', :name => 'Tiny')

#
# Animals
#

dog = Animal.find_or_create_by_id(1)
dog.add_translation('es', :name => 'Perro')
dog.add_translation('en', :name => 'Dog')

cat = Animal.find_or_create_by_id(2)
cat.add_translation('es', :name => 'Gato')
cat.add_translation('en', :name => 'Cat')

bird = Animal.find_or_create_by_id(3)
bird.add_translation('es', :name => 'Ave')
bird.add_translation('en', :name => 'Bird')

rodent = Animal.find_or_create_by_id(4)
rodent.add_translation('es', :name => 'Pequeños mamíferos')
rodent.add_translation('en', :name => 'Little mammals')

reptile = Animal.find_or_create_by_id(5)
reptile.add_translation('es', :name => 'Reptil')
reptile.add_translation('en', :name => 'Reptile')

other = Animal.find_or_create_by_id(6)
other.add_translation('es', :name => 'Otra especie')
other.add_translation('en', :name => 'Other species')

# 
# Breeds
# 
# Dogs
breed = Breed.find_or_create_by_id(1)
breed.animal = dog
breed.add_translation('es', :name => 'Mestizo')
breed.add_translation('en', :name => 'Crossbreed')

breed = Breed.find_or_create_by_id(2)
breed.animal = dog
breed.add_translation('es', :name => 'Akita Inu')
breed.add_translation('en', :name => 'Akita Inu')

breed = Breed.find_or_create_by_id(3)
breed.animal = dog
breed.add_translation('es', :name => 'Alaskan Malamute')
breed.add_translation('en', :name => 'Alaskan Malamute')

breed = Breed.find_or_create_by_id(4)
breed.animal = dog
breed.add_translation('es', :name => 'Basset Hound')
breed.add_translation('en', :name => 'Basset Hound')

breed = Breed.find_or_create_by_id(5)
breed.animal = dog
breed.add_translation('es', :name => 'Beagle')
breed.add_translation('en', :name => 'Beagle')

breed = Breed.find_or_create_by_id(6)
breed.animal = dog
breed.add_translation('es', :name => 'Beauceron')
breed.add_translation('en', :name => 'Beauceron')

breed = Breed.find_or_create_by_id(7)
breed.animal = dog
breed.add_translation('es', :name => 'Bichón Maltés')
breed.add_translation('en', :name => 'Maltese')

breed = Breed.find_or_create_by_id(8)
breed.animal = dog
breed.add_translation('es', :name => 'Bobtail')
breed.add_translation('en', :name => 'Bobtail')

breed = Breed.find_or_create_by_id(9)
breed.animal = dog
breed.add_translation('es', :name => 'Border Collie')
breed.add_translation('en', :name => 'Border Collie')

breed = Breed.find_or_create_by_id(10)
breed.animal = dog
breed.add_translation('es', :name => 'Boxer')
breed.add_translation('en', :name => 'Boxer')

breed = Breed.find_or_create_by_id(11)
breed.animal = dog
breed.add_translation('es', :name => 'Boyero de Berna')
breed.add_translation('en', :name => 'Bernese Mountain Dog')

breed = Breed.find_or_create_by_id(12)
breed.animal = dog
breed.add_translation('es', :name => 'Braco Alemán')
breed.add_translation('en', :name => 'German Shorthaired Pointer')

breed = Breed.find_or_create_by_id(13)
breed.animal = dog
breed.add_translation('es', :name => 'Bull Terrier')
breed.add_translation('en', :name => 'Bull Terrier')

breed = Breed.find_or_create_by_id(14)
breed.animal = dog
breed.add_translation('es', :name => 'Bulldog')
breed.add_translation('en', :name => 'Bulldog')

breed = Breed.find_or_create_by_id(15)
breed.animal = dog
breed.add_translation('es', :name => 'Caniche')
breed.add_translation('en', :name => 'Poodle')

breed = Breed.find_or_create_by_id(16)
breed.animal = dog
breed.add_translation('es', :name => 'Chihuahua')
breed.add_translation('en', :name => 'Chihuahua')

breed = Breed.find_or_create_by_id(17)
breed.animal = dog
breed.add_translation('es', :name => 'Chow Chow')
breed.add_translation('en', :name => 'Chow Chow')

breed = Breed.find_or_create_by_id(18)
breed.animal = dog
breed.add_translation('es', :name => 'Cocker Spaniel')
breed.add_translation('en', :name => 'Cocker Spaniel')

breed = Breed.find_or_create_by_id(19)
breed.animal = dog
breed.add_translation('es', :name => 'Collie')
breed.add_translation('en', :name => 'Collie')

breed = Breed.find_or_create_by_id(20)
breed.animal = dog
breed.add_translation('es', :name => 'Dálmata')
breed.add_translation('en', :name => 'Dalmatian')

breed = Breed.find_or_create_by_id(21)
breed.animal = dog
breed.add_translation('es', :name => 'Doberman')
breed.add_translation('en', :name => 'Doberman')

breed = Breed.find_or_create_by_id(22)
breed.animal = dog
breed.add_translation('es', :name => 'Dogo Argentino')
breed.add_translation('en', :name => 'Dogo Argentino')

breed = Breed.find_or_create_by_id(23)
breed.animal = dog
breed.add_translation('es', :name => 'Epagneul Bretón')
breed.add_translation('en', :name => 'Brittany Spaniel')

breed = Breed.find_or_create_by_id(24)
breed.animal = dog
breed.add_translation('es', :name => 'Fox Terrier')
breed.add_translation('en', :name => 'Fox Terrier')

breed = Breed.find_or_create_by_id(25)
breed.animal = dog
breed.add_translation('es', :name => 'Galgo Español')
breed.add_translation('en', :name => 'Galgo Spanish Greyhound')

breed = Breed.find_or_create_by_id(26)
breed.animal = dog
breed.add_translation('es', :name => 'Golden Retriever')
breed.add_translation('en', :name => 'Golden Retriever')

breed = Breed.find_or_create_by_id(27)
breed.animal = dog
breed.add_translation('es', :name => 'Gordon Setter')
breed.add_translation('en', :name => 'Gordon Setter')

breed = Breed.find_or_create_by_id(28)
breed.animal = dog
breed.add_translation('es', :name => 'Gran Danés')
breed.add_translation('en', :name => 'Great Dane')

breed = Breed.find_or_create_by_id(29)
breed.animal = dog
breed.add_translation('es', :name => 'Husky Siberiano')
breed.add_translation('en', :name => 'Siberian Husky')

breed = Breed.find_or_create_by_id(30)
breed.animal = dog
breed.add_translation('es', :name => 'Labrador Retriever')
breed.add_translation('en', :name => 'Labrador Retriever')

breed = Breed.find_or_create_by_id(31)
breed.animal = dog
breed.add_translation('es', :name => 'Mastiff')
breed.add_translation('en', :name => 'Mastiff')

breed = Breed.find_or_create_by_id(32)
breed.animal = dog
breed.add_translation('es', :name => 'Mastín de los Pirineos')
breed.add_translation('en', :name => 'Pyrenees dog')

breed = Breed.find_or_create_by_id(33)
breed.animal = dog
breed.add_translation('es', :name => 'Pastor Alemán')
breed.add_translation('en', :name => 'German Shepherd')

breed = Breed.find_or_create_by_id(34)
breed.animal = dog
breed.add_translation('es', :name => 'Pastor Australiano')
breed.add_translation('en', :name => 'Australian Shepherd')

breed = Breed.find_or_create_by_id(35)
breed.animal = dog
breed.add_translation('es', :name => 'Pastor Belga')
breed.add_translation('en', :name => 'Belgian Shepherd')

breed = Breed.find_or_create_by_id(36)
breed.animal = dog
breed.add_translation('es', :name => 'Pekinés')
breed.add_translation('en', :name => 'Pekingese')

breed = Breed.find_or_create_by_id(37)
breed.animal = dog
breed.add_translation('es', :name => 'Pinscher miniatura')
breed.add_translation('en', :name => 'Miniature Pinscher')

breed = Breed.find_or_create_by_id(38)
breed.animal = dog
breed.add_translation('es', :name => 'Pit Bull')
breed.add_translation('en', :name => 'Pit Bull')

breed = Breed.find_or_create_by_id(39)
breed.animal = dog
breed.add_translation('es', :name => 'Pug')
breed.add_translation('en', :name => 'Pug')

breed = Breed.find_or_create_by_id(40)
breed.animal = dog
breed.add_translation('es', :name => 'Rottweiler')
breed.add_translation('en', :name => 'Rottweiler')

breed = Breed.find_or_create_by_id(41)
breed.animal = dog
breed.add_translation('es', :name => 'Samoyedo')
breed.add_translation('en', :name => 'Samoyed')

breed = Breed.find_or_create_by_id(42)
breed.animal = dog
breed.add_translation('es', :name => 'San Bernardo')
breed.add_translation('en', :name => 'Saint Bernard')

breed = Breed.find_or_create_by_id(43)
breed.animal = dog
breed.add_translation('es', :name => 'Schnauzer')
breed.add_translation('en', :name => 'Schnauzer')

breed = Breed.find_or_create_by_id(44)
breed.animal = dog
breed.add_translation('es', :name => 'Setter Inglés')
breed.add_translation('en', :name => 'English Setter')

breed = Breed.find_or_create_by_id(45)
breed.animal = dog
breed.add_translation('es', :name => 'Setter Irlandés')
breed.add_translation('en', :name => 'Irish Setter')

breed = Breed.find_or_create_by_id(46)
breed.animal = dog
breed.add_translation('es', :name => 'Shar Pei')
breed.add_translation('en', :name => 'Shar Pei')

breed = Breed.find_or_create_by_id(47)
breed.animal = dog
breed.add_translation('es', :name => 'Shih Tzu')
breed.add_translation('en', :name => 'Shih Tzu')

breed = Breed.find_or_create_by_id(48)
breed.animal = dog
breed.add_translation('es', :name => 'Teckel')
breed.add_translation('en', :name => 'Teckel')

breed = Breed.find_or_create_by_id(49)
breed.animal = dog
breed.add_translation('es', :name => 'Terranova')
breed.add_translation('en', :name => 'Newfoundland Dog')

breed = Breed.find_or_create_by_id(50)
breed.animal = dog
breed.add_translation('es', :name => 'Westie')
breed.add_translation('en', :name => 'Westie')

breed = Breed.find_or_create_by_id(51)
breed.animal = dog
breed.add_translation('es', :name => 'Yorkshire Terrier')
breed.add_translation('en', :name => 'Yorkshire Terrier')

breed = Breed.find_or_create_by_id(52)
breed.animal = dog
breed.add_translation('es', :name => 'Otro')
breed.add_translation('en', :name => 'Other')

# Cats
cat = Animal.find(2)

breed = Breed.find_or_create_by_id(53)
breed.animal = cat
breed.add_translation('es', :name => 'Doméstico')
breed.add_translation('en', :name => 'Domestic')

breed = Breed.find_or_create_by_id(54)
breed.animal = cat
breed.add_translation('es', :name => 'Abisinio')
breed.add_translation('en', :name => 'Abyssinian')

breed = Breed.find_or_create_by_id(55)
breed.animal = cat
breed.add_translation('es', :name => 'Angora Turco')
breed.add_translation('en', :name => 'Turkish Angora')

breed = Breed.find_or_create_by_id(56)
breed.animal = cat
breed.add_translation('es', :name => 'Azul Ruso')
breed.add_translation('en', :name => 'Russian Blue')

breed = Breed.find_or_create_by_id(57)
breed.animal = cat
breed.add_translation('es', :name => 'Balinés')
breed.add_translation('en', :name => 'Balinese')

breed = Breed.find_or_create_by_id(58)
breed.animal = cat
breed.add_translation('es', :name => 'Bengal')
breed.add_translation('en', :name => 'Bengal')

breed = Breed.find_or_create_by_id(59)
breed.animal = cat
breed.add_translation('es', :name => 'Bobtail Japonés')
breed.add_translation('en', :name => 'Japanese Bobtail')

breed = Breed.find_or_create_by_id(60)
breed.animal = cat
breed.add_translation('es', :name => 'Bombay')
breed.add_translation('en', :name => 'Bombay')

breed = Breed.find_or_create_by_id(61)
breed.animal = cat
breed.add_translation('es', :name => 'Bosque de Noruega')
breed.add_translation('en', :name => 'Norwegian Forest Cat')

breed = Breed.find_or_create_by_id(62)
breed.animal = cat
breed.add_translation('es', :name => 'Británico')
breed.add_translation('en', :name => 'British')

breed = Breed.find_or_create_by_id(63)
breed.animal = cat
breed.add_translation('es', :name => 'Chartreux')
breed.add_translation('en', :name => 'Chartreux')

breed = Breed.find_or_create_by_id(64)
breed.animal = cat
breed.add_translation('es', :name => 'Cornish Rex')
breed.add_translation('en', :name => 'Cornish Rex')

breed = Breed.find_or_create_by_id(65)
breed.animal = cat
breed.add_translation('es', :name => 'Curl Americano')
breed.add_translation('en', :name => 'American Curl')

breed = Breed.find_or_create_by_id(66)
breed.animal = cat
breed.add_translation('es', :name => 'Cymric')
breed.add_translation('en', :name => 'Cymric')

breed = Breed.find_or_create_by_id(67)
breed.animal = cat
breed.add_translation('es', :name => 'Burmés')
breed.add_translation('en', :name => 'Burmese')

breed = Breed.find_or_create_by_id(68)
breed.animal = cat
breed.add_translation('es', :name => 'Esfinge')
breed.add_translation('en', :name => 'Sphynx')

breed = Breed.find_or_create_by_id(69)
breed.animal = cat
breed.add_translation('es', :name => 'Exótico')
breed.add_translation('en', :name => 'Exotic')

breed = Breed.find_or_create_by_id(70)
breed.animal = cat
breed.add_translation('es', :name => 'Fold Escocés')
breed.add_translation('en', :name => 'Scottish Fold')

breed = Breed.find_or_create_by_id(71)
breed.animal = cat
breed.add_translation('es', :name => 'Himalayo')
breed.add_translation('en', :name => 'Himalayan')

breed = Breed.find_or_create_by_id(72)
breed.animal = cat
breed.add_translation('es', :name => 'Javanés')
breed.add_translation('en', :name => 'Javanese')

breed = Breed.find_or_create_by_id(73)
breed.animal = cat
breed.add_translation('es', :name => 'Korat')
breed.add_translation('en', :name => 'Korat')

breed = Breed.find_or_create_by_id(74)
breed.animal = cat
breed.add_translation('es', :name => 'Maine Coon')
breed.add_translation('en', :name => 'Maine Coon')

breed = Breed.find_or_create_by_id(75)
breed.animal = cat
breed.add_translation('es', :name => 'Manx')
breed.add_translation('en', :name => 'Manx')

breed = Breed.find_or_create_by_id(76)
breed.animal = cat
breed.add_translation('es', :name => 'Mau Egipcio')
breed.add_translation('en', :name => 'Egyptian Mau')

breed = Breed.find_or_create_by_id(77)
breed.animal = cat
breed.add_translation('es', :name => 'Munchkin')
breed.add_translation('en', :name => 'Munchkin')

breed = Breed.find_or_create_by_id(78)
breed.animal = cat
breed.add_translation('es', :name => 'Nebelung')
breed.add_translation('en', :name => 'Nebelung')

breed = Breed.find_or_create_by_id(79)
breed.animal = cat
breed.add_translation('es', :name => 'Ocicat')
breed.add_translation('en', :name => 'Ocicat')

breed = Breed.find_or_create_by_id(80)
breed.animal = cat
breed.add_translation('es', :name => 'Oriental')
breed.add_translation('en', :name => 'Oriental')

breed = Breed.find_or_create_by_id(81)
breed.animal = cat
breed.add_translation('es', :name => 'Pelicorto Americano')
breed.add_translation('en', :name => 'American Shortair')

breed = Breed.find_or_create_by_id(82)
breed.animal = cat
breed.add_translation('es', :name => 'Persa')
breed.add_translation('en', :name => 'Persian')

breed = Breed.find_or_create_by_id(83)
breed.animal = cat
breed.add_translation('es', :name => 'Pixie Bob')
breed.add_translation('en', :name => 'Pixie Bob')

breed = Breed.find_or_create_by_id(84)
breed.animal = cat
breed.add_translation('es', :name => 'Ragdoll')
breed.add_translation('en', :name => 'Ragdoll')

breed = Breed.find_or_create_by_id(85)
breed.animal = cat
breed.add_translation('es', :name => 'Rex')
breed.add_translation('en', :name => 'Rex')

breed = Breed.find_or_create_by_id(86)
breed.animal = cat
breed.add_translation('es', :name => 'Sagrado de Birmania')
breed.add_translation('en', :name => 'Birman')

breed = Breed.find_or_create_by_id(87)
breed.animal = cat
breed.add_translation('es', :name => 'Siamés')
breed.add_translation('en', :name => 'Siamese')

breed = Breed.find_or_create_by_id(88)
breed.animal = cat
breed.add_translation('es', :name => 'Singapur')
breed.add_translation('en', :name => 'Singapura')

breed = Breed.find_or_create_by_id(89)
breed.animal = cat
breed.add_translation('es', :name => 'Skogkatt')
breed.add_translation('en', :name => 'Skogkatt')

breed = Breed.find_or_create_by_id(90)
breed.animal = cat
breed.add_translation('es', :name => 'Snowshoe')
breed.add_translation('en', :name => 'Snowshoe')

breed = Breed.find_or_create_by_id(91)
breed.animal = cat
breed.add_translation('es', :name => 'Somalí')
breed.add_translation('en', :name => 'Somali')

breed = Breed.find_or_create_by_id(92)
breed.animal = cat
breed.add_translation('es', :name => 'Tonquinés')
breed.add_translation('en', :name => 'Tonkinese')

breed = Breed.find_or_create_by_id(93)
breed.animal = cat
breed.add_translation('es', :name => 'Van Turco')
breed.add_translation('en', :name => 'Turkish Van')

breed = Breed.find_or_create_by_id(94)
breed.animal = cat
breed.add_translation('es', :name => 'Otro')
breed.add_translation('en', :name => 'Other')

# Birds
bird = Animal.find(3)

breed = Breed.find_or_create_by_id(95)
breed.animal = bird
breed.add_translation('es', :name => 'Loro')
breed.add_translation('en', :name => 'Parrot')

breed = Breed.find_or_create_by_id(96)
breed.animal = bird
breed.add_translation('es', :name => 'Periquito')
breed.add_translation('en', :name => 'Budgerigar')

breed = Breed.find_or_create_by_id(97)
breed.animal = bird
breed.add_translation('es', :name => 'Canario')
breed.add_translation('en', :name => 'Canary')

breed = Breed.find_or_create_by_id(98)
breed.animal = bird
breed.add_translation('es', :name => 'Paloma')
breed.add_translation('en', :name => 'Pigeon')

breed = Breed.find_or_create_by_id(99)
breed.animal = bird
breed.add_translation('es', :name => 'Ave Rapaz')
breed.add_translation('en', :name => 'Bird of Prey')

breed = Breed.find_or_create_by_id(100)
breed.animal = bird
breed.add_translation('es', :name => 'Otro')
breed.add_translation('en', :name => 'Other')

# Rodents
mammal = Animal.find(4)

breed = Breed.find_or_create_by_id(101)
breed.animal = mammal
breed.add_translation('es', :name => 'Hamster')
breed.add_translation('en', :name => 'Hamster')

breed = Breed.find_or_create_by_id(102)
breed.animal = mammal
breed.add_translation('es', :name => 'Conejo')
breed.add_translation('en', :name => 'Rabbit')

breed = Breed.find_or_create_by_id(103)
breed.animal = mammal
breed.add_translation('es', :name => 'Cobaya')
breed.add_translation('en', :name => 'Guinea Pig')

breed = Breed.find_or_create_by_id(104)
breed.animal = mammal
breed.add_translation('es', :name => 'Ardilla')
breed.add_translation('en', :name => 'Squirrel')

breed = Breed.find_or_create_by_id(105)
breed.animal = mammal
breed.add_translation('es', :name => 'Jerbo')
breed.add_translation('en', :name => 'Gerbil')

breed = Breed.find_or_create_by_id(106)
breed.animal = mammal
breed.add_translation('es', :name => 'Chinchilla')
breed.add_translation('en', :name => 'Chinchilla')

breed = Breed.find_or_create_by_id(107)
breed.animal = mammal
breed.add_translation('es', :name => 'Ratón')
breed.add_translation('en', :name => 'Mouse')

breed = Breed.find_or_create_by_id(108)
breed.animal = mammal
breed.add_translation('es', :name => 'Rata')
breed.add_translation('en', :name => 'Rat')

breed = Breed.find_or_create_by_id(109)
breed.animal = mammal
breed.add_translation('es', :name => 'Hurón')
breed.add_translation('en', :name => 'Ferret')

breed = Breed.find_or_create_by_id(110)
breed.animal = mammal
breed.add_translation('es', :name => 'Erizo')
breed.add_translation('en', :name => 'Hedgehog')

breed = Breed.find_or_create_by_id(111)
breed.animal = mammal
breed.add_translation('es', :name => 'Otro')
breed.add_translation('en', :name => 'Other')

# Reptiles
reptile = Animal.find(5)

breed = Breed.find_or_create_by_id(112)
breed.animal = reptile
breed.add_translation('es', :name => 'Tortuga')
breed.add_translation('en', :name => 'Turtle')

breed = Breed.find_or_create_by_id(113)
breed.animal = reptile
breed.add_translation('es', :name => 'Iguana')
breed.add_translation('en', :name => 'Iguana')

breed = Breed.find_or_create_by_id(114)
breed.animal = reptile
breed.add_translation('es', :name => 'Serpiente')
breed.add_translation('en', :name => 'Snake')

breed = Breed.find_or_create_by_id(115)
breed.animal = reptile
breed.add_translation('es', :name => 'Camaleón')
breed.add_translation('en', :name => 'Chameleon')

breed = Breed.find_or_create_by_id(116)
breed.animal = reptile
breed.add_translation('es', :name => 'Lagarto')
breed.add_translation('en', :name => 'Lizzard')

breed = Breed.find_or_create_by_id(117)
breed.animal = reptile
breed.add_translation('es', :name => 'Gecko')
breed.add_translation('en', :name => 'Gecko')

breed = Breed.find_or_create_by_id(118)
breed.animal = reptile
breed.add_translation('es', :name => 'Otro')
breed.add_translation('en', :name => 'Other')

# Others
other = Animal.find(6)
breed = Breed.find_or_create_by_id(119)
breed.animal = other
breed.add_translation('es', :name => 'Arácnido')
breed.add_translation('en', :name => 'Arachnid')

breed = Breed.find_or_create_by_id(120)
breed.animal = other
breed.add_translation('es', :name => 'Insecto')
breed.add_translation('en', :name => 'Insect')

breed = Breed.find_or_create_by_id(121)
breed.animal = other
breed.add_translation('es', :name => 'Otro')
breed.add_translation('en', :name => 'Other')

# Diseases
leishmaniasis = Disease.find_or_create_by_id(1)
leishmaniasis.animal = dog
leishmaniasis.add_translation('es', :name => 'Leishmania canina')
leishmaniasis.add_translation('en', :name => 'Canine leishmaniasis')

filariasis = Disease.find_or_create_by_id(2)
filariasis.animal = dog
filariasis.add_translation('es', :name => 'Filaria canina')
filariasis.add_translation('en', :name => 'Canine filariasis')

ehrlichiosis = Disease.find_or_create_by_id(3)
ehrlichiosis.animal = dog
ehrlichiosis.add_translation('es', :name => 'Erliquia canina')
ehrlichiosis.add_translation('en', :name => 'Canine ehrlichiosis')

leukemia = Disease.find_or_create_by_id(4)
leukemia.animal = cat
leukemia.add_translation('es', :name => 'Leucemia felina')
leukemia.add_translation('en', :name => 'Feline leukemia')

immunodeficiency = Disease.find_or_create_by_id(5)
immunodeficiency.animal = cat
immunodeficiency.add_translation('es', :name => 'Inmunodeficiencia felina')
immunodeficiency.add_translation('en', :name => 'Feline immunodeficiency')
