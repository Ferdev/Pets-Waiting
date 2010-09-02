class Animal < ActiveRecord::Base
  translates :name
  
  has_many :pets
  has_many :breeds
end
