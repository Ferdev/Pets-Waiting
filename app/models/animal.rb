class Animal < ActiveRecord::Base
  translates :name
  
  has_many :pets
end
