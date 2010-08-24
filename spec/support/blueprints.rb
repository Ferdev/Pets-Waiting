require 'machinist/active_record'
require 'sham'

Sham.description { 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' }

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
  animal
  breed
  sex
  birthday { 4.years.ago }
  size
  urgent { true }
  docile { true }
  playful { true }
  obedient { true }
  description
  user
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