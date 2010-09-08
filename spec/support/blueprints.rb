require 'machinist/active_record'
require 'sham'

Address.blueprint do
  address { 'Calle de Torrelavega, 62, 28140 Fuente el Saz de Jarama, Spain' }
  street { 'Calle de Torrelavega, 62' }
  postal_code { '28140' }
  lat { '40.637086' }
  lon { '-3.510735' }
  country { 'Spain' }
  country_code { 'ES' }
  state { 'Madrid' }
  substate { 'Madrid' }
  city { 'Fuente el Saz de Jarama' }
end

Animal.blueprint do
  name { "Dog" }
end

Breed.blueprint do
  name { "Crossbred" }
  animal
end

Pet.blueprint do
  name { 'Wadus' }
  sex
  birthday { 4.years.ago }
  size
  urgent { true }
  docile { true }
  playful { true }
  obedient { true }
  description
end

Photo.blueprint do
  
end

Sex.blueprint do
  name { "Male" }
end

Size.blueprint do
  name { "Medium" }
end

User.blueprint do
  email { 'wadus@wadus.com' }
  password { 'waduswadus' }
  password_confirmation { 'waduswadus' }
end