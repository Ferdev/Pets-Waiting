# encoding: UTF-8

################################
#         TRANSLATIONS         #
################################
#
# Sexes
#
Sex.translations_for :name => 'Male' do |male|
  male.add_translation('es', :name => 'Macho')
  male.add_translation('en', :name => 'Male')
end

Sex.translations_for :name => 'Female' do |female|
  female.add_translation('es', :name => 'Hembra')
  female.add_translation('en', :name => 'Female')
end

#
# Sizes
#
Size.translations_for :name => 'Huge' do |huge|
  huge.add_translation('es', :name => 'Enorme')
  huge.add_translation('en', :name => 'Huge')
end

Size.translations_for :name => 'Big' do |big|
  big.add_translation('es', :name => 'Grande')
  big.add_translation('en', :name => 'Big')
end

Size.translations_for :name => 'Medium' do |medium|
  medium.add_translation('es', :name => 'Mediano')
  medium.add_translation('en', :name => 'Medium')
end

Size.translations_for :name => 'Small' do |small|
  small.add_translation('es', :name => 'Pequeño')
  small.add_translation('en', :name => 'Small')
end

Size.translations_for :name => 'Tiny' do |tiny|
  tiny.add_translation('es', :name => 'Enano')
  tiny.add_translation('en', :name => 'Tiny')
end

# 
# Animals
#
Animal.translations_for :name => 'Dog' do |dog|
  dog.add_translation('es', :name => 'Perro')
  dog.add_translation('en', :name => 'Dog')

  # Breeds
  dog.breeds.translations_for(:name => 'Crossbreed') do |breed|
    breed.add_translation('es', :name => 'Mestizo')
    breed.add_translation('en', :name => 'Crossbreed')
  end
  
  dog.breeds.translations_for(:name => 'Akita Inu') do |breed|
    breed.add_translation('es', :name => 'Akita Inu')
    breed.add_translation('en', :name => 'Akita Inu')
  end

  dog.breeds.translations_for(:name => 'Alaskan Malamute') do |breed|
    breed.add_translation('es', :name => 'Alaskan Malamute')
    breed.add_translation('en', :name => 'Alaskan Malamute')
  end

  dog.breeds.translations_for(:name => 'Basset Hound') do |breed|
    breed.add_translation('es', :name => 'Basset Hound')
    breed.add_translation('en', :name => 'Basset Hound')
  end

  dog.breeds.translations_for(:name => 'Beagle') do |breed|
    breed.add_translation('es', :name => 'Beagle')
    breed.add_translation('en', :name => 'Beagle')
  end

  dog.breeds.translations_for(:name => 'Beauceron') do |breed|
    breed.add_translation('es', :name => 'Beauceron')
    breed.add_translation('en', :name => 'Beauceron')
  end

  dog.breeds.translations_for(:name => 'Maltese') do |breed|
    breed.add_translation('es', :name => 'Bichón Maltés')
    breed.add_translation('en', :name => 'Maltese')
  end

  dog.breeds.translations_for(:name => 'Bobtail') do |breed|
    breed.add_translation('es', :name => 'Bobtail')
    breed.add_translation('en', :name => 'Bobtail')
  end

  dog.breeds.translations_for(:name => 'Border Collie') do |breed|
    breed.add_translation('es', :name => 'Border Collie')
    breed.add_translation('en', :name => 'Border Collie')
  end

  dog.breeds.translations_for(:name => 'Boxer') do |breed|
    breed.add_translation('es', :name => 'Boxer')
    breed.add_translation('en', :name => 'Boxer')
  end

  dog.breeds.translations_for(:name => 'Bernese Mountain Dog') do |breed|
    breed.add_translation('es', :name => 'Boyero de Berna')
    breed.add_translation('en', :name => 'Bernese Mountain Dog')
  end

  dog.breeds.translations_for(:name => 'German Shorthaired Pointer') do |breed|
    breed.add_translation('es', :name => 'Braco Alemán')
    breed.add_translation('en', :name => 'German Shorthaired Pointer')
  end

  dog.breeds.translations_for(:name => 'Bull Terrier') do |breed|
    breed.add_translation('es', :name => 'Bull Terrier')
    breed.add_translation('en', :name => 'Bull Terrier')
  end

  dog.breeds.translations_for(:name => 'Bulldog') do |breed|
    breed.add_translation('es', :name => 'Bulldog')
    breed.add_translation('en', :name => 'Bulldog')
  end

  dog.breeds.translations_for(:name => 'Poodle') do |breed|
    breed.add_translation('es', :name => 'Caniche')
    breed.add_translation('en', :name => 'Poodle')
  end

  dog.breeds.translations_for(:name => 'Chihuahua') do |breed|
    breed.add_translation('es', :name => 'Chihuahua')
    breed.add_translation('en', :name => 'Chihuahua')
  end

  dog.breeds.translations_for(:name => 'Chow Chow') do |breed|
    breed.add_translation('es', :name => 'Chow Chow')
    breed.add_translation('en', :name => 'Chow Chow')
  end

  dog.breeds.translations_for(:name => 'Cocker Spaniel') do |breed|
    breed.add_translation('es', :name => 'Cocker Spaniel')
    breed.add_translation('en', :name => 'Cocker Spaniel')
  end

  dog.breeds.translations_for(:name => 'Collie') do |breed|
    breed.add_translation('es', :name => 'Collie')
    breed.add_translation('en', :name => 'Collie')
  end

  dog.breeds.translations_for(:name => 'Dalmatian') do |breed|
    breed.add_translation('es', :name => 'Dálmata')
    breed.add_translation('en', :name => 'Dalmatian')
  end

  dog.breeds.translations_for(:name => 'Doberman') do |breed|
    breed.add_translation('es', :name => 'Doberman')
    breed.add_translation('en', :name => 'Doberman')
  end

  dog.breeds.translations_for(:name => 'Dogo Argentino') do |breed|
    breed.add_translation('es', :name => 'Dogo Argentino')
    breed.add_translation('en', :name => 'Dogo Argentino')
  end

  dog.breeds.translations_for(:name => 'Brittany Spaniel') do |breed|
    breed.add_translation('es', :name => 'Epagneul Bretón')
    breed.add_translation('en', :name => 'Brittany Spaniel')
  end

  dog.breeds.translations_for(:name => 'Fox Terrier') do |breed|
    breed.add_translation('es', :name => 'Fox Terrier')
    breed.add_translation('en', :name => 'Fox Terrier')
  end

  dog.breeds.translations_for(:name => 'Galgo Spanish Greyhound') do |breed|
    breed.add_translation('es', :name => 'Galgo Español')
    breed.add_translation('en', :name => 'Galgo Spanish Greyhound')
  end

  dog.breeds.translations_for(:name => 'Golden Retriever') do |breed|
    breed.add_translation('es', :name => 'Golden Retriever')
    breed.add_translation('en', :name => 'Golden Retriever')
  end

  dog.breeds.translations_for(:name => 'Gordon Setter') do |breed|
    breed.add_translation('es', :name => 'Gordon Setter')
    breed.add_translation('en', :name => 'Gordon Setter')
  end

  dog.breeds.translations_for(:name => 'Great Dane') do |breed|
    breed.add_translation('es', :name => 'Gran Danés')
    breed.add_translation('en', :name => 'Great Dane')
  end

  dog.breeds.translations_for(:name => 'Siberian Husky') do |breed|
    breed.add_translation('es', :name => 'Husky Siberiano')
    breed.add_translation('en', :name => 'Siberian Husky')
  end

  dog.breeds.translations_for(:name => 'Labrador Retriever') do |breed|
    breed.add_translation('es', :name => 'Labrador Retriever')
    breed.add_translation('en', :name => 'Labrador Retriever')
  end

  dog.breeds.translations_for(:name => 'Mastiff') do |breed|
    breed.add_translation('es', :name => 'Mastiff')
    breed.add_translation('en', :name => 'Mastiff')
  end

  dog.breeds.translations_for(:name => 'Pyrenees dog') do |breed|
    breed.add_translation('es', :name => 'Mastín de los Pirineos')
    breed.add_translation('en', :name => 'Pyrenees dog')
  end

  dog.breeds.translations_for(:name => 'German Shepherd') do |breed|
    breed.add_translation('es', :name => 'Pastor Alemán')
    breed.add_translation('en', :name => 'German Shepherd')
  end

  dog.breeds.translations_for(:name => 'Australian Shepherd') do |breed|
    breed.add_translation('es', :name => 'Pastor Australiano')
    breed.add_translation('en', :name => 'Australian Shepherd')
  end

  dog.breeds.translations_for(:name => 'Belgian Shepherd') do |breed|
    breed.add_translation('es', :name => 'Pastor Belga')
    breed.add_translation('en', :name => 'Belgian Shepherd')
  end

  dog.breeds.translations_for(:name => 'Pekingese') do |breed|
    breed.add_translation('es', :name => 'Pekinés')
    breed.add_translation('en', :name => 'Pekingese')
  end

  dog.breeds.translations_for(:name => 'Miniature Pinscher') do |breed|
    breed.add_translation('es', :name => 'Pinscher miniatura')
    breed.add_translation('en', :name => 'Miniature Pinscher')
  end

  dog.breeds.translations_for(:name => 'Pit Bull') do |breed|
    breed.add_translation('es', :name => 'Pit Bull')
    breed.add_translation('en', :name => 'Pit Bull')
  end

  dog.breeds.translations_for(:name => 'Pug') do |breed|
    breed.add_translation('es', :name => 'Pug')
    breed.add_translation('en', :name => 'Pug')
  end

  dog.breeds.translations_for(:name => 'Rottweiler') do |breed|
    breed.add_translation('es', :name => 'Rottweiler')
    breed.add_translation('en', :name => 'Rottweiler')
  end

  dog.breeds.translations_for(:name => 'Samoyed') do |breed|
    breed.add_translation('es', :name => 'Samoyedo')
    breed.add_translation('en', :name => 'Samoyed')
  end

  dog.breeds.translations_for(:name => 'Saint Bernard') do |breed|
    breed.add_translation('es', :name => 'San Bernardo')
    breed.add_translation('en', :name => 'Saint Bernard')
  end

  dog.breeds.translations_for(:name => 'Schnauzer') do |breed|
    breed.add_translation('es', :name => 'Schnauzer')
    breed.add_translation('en', :name => 'Schnauzer')
  end

  dog.breeds.translations_for(:name => 'English Setter') do |breed|
    breed.add_translation('es', :name => 'Setter Inglés')
    breed.add_translation('en', :name => 'English Setter')
  end

  dog.breeds.translations_for(:name => 'Irish Setter') do |breed|
    breed.add_translation('es', :name => 'Setter Irlandés')
    breed.add_translation('en', :name => 'Irish Setter')
  end

  dog.breeds.translations_for(:name => 'Shar Pei') do |breed|
    breed.add_translation('es', :name => 'Shar Pei')
    breed.add_translation('en', :name => 'Shar Pei')
  end

  dog.breeds.translations_for(:name => 'Shih Tzu') do |breed|
    breed.add_translation('es', :name => 'Shih Tzu')
    breed.add_translation('en', :name => 'Shih Tzu')
  end

  dog.breeds.translations_for(:name => 'Teckel') do |breed|
    breed.add_translation('es', :name => 'Teckel')
    breed.add_translation('en', :name => 'Teckel')
  end

  dog.breeds.translations_for(:name => 'Newfoundland Dog') do |breed|
    breed.add_translation('es', :name => 'Terranova')
    breed.add_translation('en', :name => 'Newfoundland Dog')
  end

  dog.breeds.translations_for(:name => 'Westie') do |breed|
    breed.add_translation('es', :name => 'Westie')
    breed.add_translation('en', :name => 'Westie')
  end

  dog.breeds.translations_for(:name => 'Yorkshire Terrier') do |breed|
    breed.add_translation('es', :name => 'Yorkshire Terrier')
    breed.add_translation('en', :name => 'Yorkshire Terrier')
  end

  dog.breeds.translations_for(:name => 'Other') do |dog_crossbreed|
    dog_crossbreed.add_translation('es', :name => 'Otro')
    dog_crossbreed.add_translation('en', :name => 'Other')
  end
  
  # Diseases
  dog.diseases.translations_for(:name => 'Canine leishmaniasis') do |leishmaniasis|
    leishmaniasis.add_translation('es', :name => 'Leishmania canina')
    leishmaniasis.add_translation('en', :name => 'Canine leishmaniasis')
  end

  dog.diseases.translations_for(:name => 'Canine filariasis') do |filariasis|
    filariasis.add_translation('es', :name => 'Filaria canina')
    filariasis.add_translation('en', :name => 'Canine filariasis')
  end

  dog.diseases.translations_for(:name => 'Canine ehrlichiosis') do |ehrlichiosis|
    ehrlichiosis.add_translation('es', :name => 'Erliquia canina')
    ehrlichiosis.add_translation('en', :name => 'Canine ehrlichiosis')
  end
end

Animal.translations_for :name => 'Cat' do |cat|
  cat.add_translation('es', :name => 'Gato')
  cat.add_translation('en', :name => 'Cat')
  
  cat.breeds.translations_for(:name => 'Domestic') do |breed|
    breed.add_translation('es', :name => 'Doméstico')
    breed.add_translation('en', :name => 'Domestic')
  end

  cat.breeds.translations_for(:name => 'Abyssinian') do |breed|
    breed.add_translation('es', :name => 'Abisinio')
    breed.add_translation('en', :name => 'Abyssinian')
  end

  cat.breeds.translations_for(:name => 'Turkish Angora') do |breed|
    breed.add_translation('es', :name => 'Angora Turco')
    breed.add_translation('en', :name => 'Turkish Angora')
  end

  cat.breeds.translations_for(:name => 'Russian Blue') do |breed|
    breed.add_translation('es', :name => 'Azul Ruso')
    breed.add_translation('en', :name => 'Russian Blue')
  end

  cat.breeds.translations_for(:name => 'Balinese') do |breed|
    breed.add_translation('es', :name => 'Balinés')
    breed.add_translation('en', :name => 'Balinese')
  end

  cat.breeds.translations_for(:name => 'Bengal') do |breed|
    breed.add_translation('es', :name => 'Bengal')
    breed.add_translation('en', :name => 'Bengal')
  end

  cat.breeds.translations_for(:name => 'Japanese Bobtail') do |breed|
    breed.add_translation('es', :name => 'Bobtail Japonés')
    breed.add_translation('en', :name => 'Japanese Bobtail')
  end

  cat.breeds.translations_for(:name => 'Bombay') do |breed|
    breed.add_translation('es', :name => 'Bombay')
    breed.add_translation('en', :name => 'Bombay')
  end

  cat.breeds.translations_for(:name => 'Norwegian Forest Cat') do |breed|
    breed.add_translation('es', :name => 'Bosque de Noruega')
    breed.add_translation('en', :name => 'Norwegian Forest Cat')
  end

  cat.breeds.translations_for(:name => 'British') do |breed|
    breed.add_translation('es', :name => 'Británico')
    breed.add_translation('en', :name => 'British')
  end

  cat.breeds.translations_for(:name => 'Chartreux') do |breed|
    breed.add_translation('es', :name => 'Chartreux')
    breed.add_translation('en', :name => 'Chartreux')
  end

  cat.breeds.translations_for(:name => 'Cornish Rex') do |breed|
    breed.add_translation('es', :name => 'Cornish Rex')
    breed.add_translation('en', :name => 'Cornish Rex')
  end

  cat.breeds.translations_for(:name => 'American Curl') do |breed|
    breed.add_translation('es', :name => 'Curl Americano')
    breed.add_translation('en', :name => 'American Curl')
  end

  cat.breeds.translations_for(:name => 'Cymric') do |breed|
    breed.add_translation('es', :name => 'Cymric')
    breed.add_translation('en', :name => 'Cymric')
  end

  cat.breeds.translations_for(:name => 'Burmese') do |breed|
    breed.add_translation('es', :name => 'Burmés')
    breed.add_translation('en', :name => 'Burmese')
  end

  cat.breeds.translations_for(:name => 'Sphynx') do |breed|
    breed.add_translation('es', :name => 'Esfinge')
    breed.add_translation('en', :name => 'Sphynx')
  end

  cat.breeds.translations_for(:name => 'Exotic') do |breed|
    breed.add_translation('es', :name => 'Exótico')
    breed.add_translation('en', :name => 'Exotic')
  end

  cat.breeds.translations_for(:name => 'Scottish Fold') do |breed|
    breed.add_translation('es', :name => 'Fold Escocés')
    breed.add_translation('en', :name => 'Scottish Fold')
  end

  cat.breeds.translations_for(:name => 'Himalayan') do |breed|
    breed.add_translation('es', :name => 'Himalayo')
    breed.add_translation('en', :name => 'Himalayan')
  end

  cat.breeds.translations_for(:name => 'Javanese') do |breed|
    breed.add_translation('es', :name => 'Javanés')
    breed.add_translation('en', :name => 'Javanese')
  end

  cat.breeds.translations_for(:name => 'Korat') do |breed|
    breed.add_translation('es', :name => 'Korat')
    breed.add_translation('en', :name => 'Korat')
  end

  cat.breeds.translations_for(:name => 'Maine Coon') do |breed|
    breed.add_translation('es', :name => 'Maine Coon')
    breed.add_translation('en', :name => 'Maine Coon')
  end

  cat.breeds.translations_for(:name => 'Manx') do |breed|
    breed.add_translation('es', :name => 'Manx')
    breed.add_translation('en', :name => 'Manx')
  end

  cat.breeds.translations_for(:name => 'Egyptian Mau') do |breed|
    breed.add_translation('es', :name => 'Mau Egipcio')
    breed.add_translation('en', :name => 'Egyptian Mau')
  end

  cat.breeds.translations_for(:name => 'Munchkin') do |breed|
    breed.add_translation('es', :name => 'Munchkin')
    breed.add_translation('en', :name => 'Munchkin')
  end

  cat.breeds.translations_for(:name => 'Nebelung') do |breed|
    breed.add_translation('es', :name => 'Nebelung')
    breed.add_translation('en', :name => 'Nebelung')
  end

  cat.breeds.translations_for(:name => 'Ocicat') do |breed|
    breed.add_translation('es', :name => 'Ocicat')
    breed.add_translation('en', :name => 'Ocicat')
  end

  cat.breeds.translations_for(:name => 'Oriental') do |breed|
    breed.add_translation('es', :name => 'Oriental')
    breed.add_translation('en', :name => 'Oriental')
  end

  cat.breeds.translations_for(:name => 'American Shortair') do |breed|
    breed.add_translation('es', :name => 'Pelicorto Americano')
    breed.add_translation('en', :name => 'American Shortair')
  end

  cat.breeds.translations_for(:name => 'Persian') do |breed|
    breed.add_translation('es', :name => 'Persa')
    breed.add_translation('en', :name => 'Persian')
  end

  cat.breeds.translations_for(:name => 'Pixie Bob') do |breed|
    breed.add_translation('es', :name => 'Pixie Bob')
    breed.add_translation('en', :name => 'Pixie Bob')
  end

  cat.breeds.translations_for(:name => 'Ragdoll') do |breed|
    breed.add_translation('es', :name => 'Ragdoll')
    breed.add_translation('en', :name => 'Ragdoll')
  end

  cat.breeds.translations_for(:name => 'Rex') do |breed|
    breed.add_translation('es', :name => 'Rex')
    breed.add_translation('en', :name => 'Rex')
  end

  cat.breeds.translations_for(:name => 'Birman') do |breed|
    breed.add_translation('es', :name => 'Sagrado de Birmania')
    breed.add_translation('en', :name => 'Birman')
  end

  cat.breeds.translations_for(:name => 'Siamese') do |breed|
    breed.add_translation('es', :name => 'Siamés')
    breed.add_translation('en', :name => 'Siamese')
  end

  cat.breeds.translations_for(:name => 'Singapura') do |breed|
    breed.add_translation('es', :name => 'Singapur')
    breed.add_translation('en', :name => 'Singapura')
  end

  cat.breeds.translations_for(:name => 'Skogkatt') do |breed|
    breed.add_translation('es', :name => 'Skogkatt')
    breed.add_translation('en', :name => 'Skogkatt')
  end

  cat.breeds.translations_for(:name => 'Snowshoe') do |breed|
    breed.add_translation('es', :name => 'Snowshoe')
    breed.add_translation('en', :name => 'Snowshoe')
  end

  cat.breeds.translations_for(:name => 'Somali') do |breed|
    breed.add_translation('es', :name => 'Somalí')
    breed.add_translation('en', :name => 'Somali')
  end

  cat.breeds.translations_for(:name => 'Tonkinese') do |breed|
    breed.add_translation('es', :name => 'Tonquinés')
    breed.add_translation('en', :name => 'Tonkinese')
  end

  cat.breeds.translations_for(:name => 'Turkish Van') do |breed|
    breed.add_translation('es', :name => 'Van Turco')
    breed.add_translation('en', :name => 'Turkish Van')
  end

  cat.breeds.translations_for(:name => 'Other') do |breed|
    breed.add_translation('es', :name => 'Otro')
    breed.add_translation('en', :name => 'Other')
  end
  
  # Diseases
  cat.diseases.translations_for(:name => 'Feline leukemia') do |leukemia|
    leukemia.add_translation('es', :name => 'Leucemia felina')
    leukemia.add_translation('en', :name => 'Feline leukemia')
  end

  cat.diseases.translations_for(:name => 'Feline immunodeficiency') do |immunodeficiency|
    immunodeficiency.add_translation('es', :name => 'Inmunodeficiencia felina')
    immunodeficiency.add_translation('en', :name => 'Feline immunodeficiency')
  end

end

Animal.translations_for :name => 'Bird' do |bird|
  bird.add_translation('es', :name => 'Ave')
  bird.add_translation('en', :name => 'Bird')
  
  bird.breeds.translations_for(:name => 'Parrot') do |breed|
    breed.add_translation('es', :name => 'Loro')
    breed.add_translation('en', :name => 'Parrot')
  end

  bird.breeds.translations_for(:name => 'Budgerigar') do |breed|
    breed.add_translation('es', :name => 'Periquito')
    breed.add_translation('en', :name => 'Budgerigar')
  end

  bird.breeds.translations_for(:name => 'Canary') do |breed|
    breed.add_translation('es', :name => 'Canario')
    breed.add_translation('en', :name => 'Canary')
  end

  bird.breeds.translations_for(:name => 'Pigeon') do |breed|
    breed.add_translation('es', :name => 'Paloma')
    breed.add_translation('en', :name => 'Pigeon')
  end

  bird.breeds.translations_for(:name => 'Bird of Prey') do |breed|
    breed.add_translation('es', :name => 'Ave Rapaz')
    breed.add_translation('en', :name => 'Bird of Prey')
  end

  bird.breeds.translations_for(:name => 'Other') do |breed|
    breed.add_translation('es', :name => 'Otro')
    breed.add_translation('en', :name => 'Other')
  end
end

Animal.translations_for :name => 'Little mammals' do |mammal|
  mammal.add_translation('es', :name => 'Pequeños mamíferos')
  mammal.add_translation('en', :name => 'Little mammals')

  mammal.breeds.translations_for(:name => 'Hamster') do |breed|
    breed.add_translation('es', :name => 'Hamster')
    breed.add_translation('en', :name => 'Hamster')
  end

  mammal.breeds.translations_for(:name => 'Rabbit') do |breed|
    breed.add_translation('es', :name => 'Conejo')
    breed.add_translation('en', :name => 'Rabbit')
  end

  mammal.breeds.translations_for(:name => 'Guinea Pig') do |breed|
    breed.add_translation('es', :name => 'Cobaya')
    breed.add_translation('en', :name => 'Guinea Pig')
  end

  mammal.breeds.translations_for(:name => 'Squirrel') do |breed|
    breed.add_translation('es', :name => 'Ardilla')
    breed.add_translation('en', :name => 'Squirrel')
  end

  mammal.breeds.translations_for(:name => 'Gerbil') do |breed|
    breed.add_translation('es', :name => 'Jerbo')
    breed.add_translation('en', :name => 'Gerbil')
  end

  mammal.breeds.translations_for(:name => 'Chinchilla') do |breed|
    breed.add_translation('es', :name => 'Chinchilla')
    breed.add_translation('en', :name => 'Chinchilla')
  end

  mammal.breeds.translations_for(:name => 'Mouse') do |breed|
    breed.add_translation('es', :name => 'Ratón')
    breed.add_translation('en', :name => 'Mouse')
  end

  mammal.breeds.translations_for(:name => 'Rat') do |breed|
    breed.add_translation('es', :name => 'Rata')
    breed.add_translation('en', :name => 'Rat')
  end

  mammal.breeds.translations_for(:name => 'Ferret') do |breed|
    breed.add_translation('es', :name => 'Hurón')
    breed.add_translation('en', :name => 'Ferret')
  end

  mammal.breeds.translations_for(:name => 'Hedgehog') do |breed|
    breed.add_translation('es', :name => 'Erizo')
    breed.add_translation('en', :name => 'Hedgehog')
  end

  mammal.breeds.translations_for(:name => 'Other') do |breed|
    breed.add_translation('es', :name => 'Otro')
    breed.add_translation('en', :name => 'Other')
  end
end


Animal.translations_for :name => 'Reptile' do |reptile|
  reptile.add_translation('es', :name => 'Reptil')
  reptile.add_translation('en', :name => 'Reptile')

  reptile.breeds.translations_for(:name => 'Turtle') do |breed|
    breed.add_translation('es', :name => 'Tortuga')
    breed.add_translation('en', :name => 'Turtle')
  end

  reptile.breeds.translations_for(:name => 'Iguana') do |breed|
    breed.add_translation('es', :name => 'Iguana')
    breed.add_translation('en', :name => 'Iguana')
  end

  reptile.breeds.translations_for(:name => 'Snake') do |breed|
    breed.add_translation('es', :name => 'Serpiente')
    breed.add_translation('en', :name => 'Snake')
  end

  reptile.breeds.translations_for(:name => 'Chameleon') do |breed|
    breed.add_translation('es', :name => 'Camaleón')
    breed.add_translation('en', :name => 'Chameleon')
  end

  reptile.breeds.translations_for(:name => 'Lizzard') do |breed|
    breed.add_translation('es', :name => 'Lagarto')
    breed.add_translation('en', :name => 'Lizzard')
  end

  reptile.breeds.translations_for(:name => 'Gecko') do |breed|
    breed.add_translation('es', :name => 'Gecko')
    breed.add_translation('en', :name => 'Gecko')
  end

  reptile.breeds.translations_for(:name => 'Other') do |breed|
    breed.add_translation('es', :name => 'Otro')
    breed.add_translation('en', :name => 'Other')
  end
end

Animal.translations_for :name => 'Other species' do |other|
  other.add_translation('es', :name => 'Otra especie')
  other.add_translation('en', :name => 'Other species')

  other.breeds.translations_for(:name => 'Arachnid') do |breed|
    breed.add_translation('es', :name => 'Arácnido')
    breed.add_translation('en', :name => 'Arachnid')
  end

  other.breeds.translations_for(:name => 'Insect') do |breed|
    breed.add_translation('es', :name => 'Insecto')
    breed.add_translation('en', :name => 'Insect')
  end

  other.breeds.translations_for(:name => 'Other') do |breed|
    breed.add_translation('es', :name => 'Otro')
    breed.add_translation('en', :name => 'Other')
  end
end