require 'machinist/active_record'
require 'sham'

Animal.blueprint do
  name { "Dog" }
end

Breed.blueprint do
  name { "Crossbred" }
  animal
end

Size.blueprint do
  name { "Medium" }
end

User.blueprint do
  email { 'wadus@wadus.com' }
  password { 'waduswadus' }
  password_confirmation { 'waduswadus' }
end