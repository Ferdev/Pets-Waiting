class Breed < ActiveRecord::Base
  attr_accessible :name
  
  translates :name
  
  belongs_to :animal
  
  scope :by_animal_id, lambda { |animal_id| where("animal_id = ?", animal_id)}
end
