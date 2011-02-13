# encoding: UTF-8
FactoryGirl.define do
  factory :address do
    address      'Calle de Torrelavega, 62, 28140 Fuente el Saz de Jarama, Spain'
    street       'Calle de Torrelavega, 62'
    postal_code  '28140'
    lat          '40.637086'
    lon          '-3.510735'
    country      'Spain'
    country_code 'ES'
    state        'Madrid'
    substate     'Madrid'
    city         'Fuente el Saz de Jarama'
  end

  factory :adoption do
  end

  factory :dog, :class => Animal do
    name 'Dog'
  end

  factory :cat, :class => Animal do
    name 'Cat'
  end

  factory :bird, :class => Animal do
    name 'Bird'
  end

  factory :little_mammal, :class => Animal do
    name 'Little mammals'
  end

  factory :reptile, :class => Animal do
    name 'Reptile'
  end

  factory :other_species, :class => Animal do
    name 'Other species'
  end

  factory :crossbred_dog, :class => Breed do
    name "Crossbred"
    animal { Animal.dog }
  end

  factory :crossbred_cat, :class => Breed do
    name "Crossbred"
    animal { Animal.cat }
  end

  factory :crossbred_bird, :class => Breed do
    name "Crossbred"
    animal { Animal.bird }
  end

  factory :crossbred_little_mammal, :class => Breed do
    name "Crossbred"
    animal { Animal.little_mammal }
  end

  factory :crossbred_reptile, :class => Breed do
    name "Crossbred"
    animal { Animal.reptile }
  end

  factory :crossbred_other_species, :class => Breed do
    name "Crossbred"
    animal { Animal.other_species }
  end

  factory :pet do
    name      'Wadus'
    birthday  4.years.ago
    urgent    true
    docile    true
    playful   true
    obedient  true
    address
    size
    sex
    user { User.first }
  end

  factory :leishmaniasis, :class => Disease do
    name 'Canine leishmaniasis'
    animal { Animal.dog }
  end

  factory :filariasis, :class => Disease do
    name 'Canine filariasis'
    animal { Animal.dog }
  end

  factory :ehrlichiosis, :class => Disease do
    name 'Canine ehrlichiosis'
    animal { Animal.dog }
  end

  factory :leukemia, :class => Disease do
    name 'Feline leukemia'
    animal { Animal.cat }
  end

  factory :immunodeficiency, :class => Disease do
    name 'Feline immunodeficiency'
    animal { Animal.cat }
  end

  factory :sex do
    name "Male"
  end

  factory :male, :class => Sex do
    name "Male"
  end

  factory :female, :class => Sex do
    name "Female"
  end

  factory :size do
    name "Medium"
  end

  factory :user do
    association_name      'Pet Protectors'
    name                  'Wadus'
    email                 'fer@ferdev.com'
    password              'waduswadus'
    password_confirmation 'waduswadus'
    phone_number          '0034666554433'
    address
  end

  factory :guest, :class => User do
    name                  'Guest'
    email                 'fernando.espinosa@gmail.com'
    password              'waduswadus'
    password_confirmation 'waduswadus'
    phone_number          '0034666554433'
    address
  end
end