class Breed < ActiveRecord::Base
  translates :name
  
  belongs_to :animal
end
