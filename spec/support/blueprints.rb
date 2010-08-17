require 'machinist/active_record'
require 'sham'

Animal.blueprint do
  name { "Dog" }
end

Breed.blueprint do
  name { "Crossbred" }
  animal
end

User.blueprint do
  email { 'wadus@wadus.com' }
  password { 'waduswadus' }
  password_confirmation { 'waduswadus' }
end