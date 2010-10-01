class Disease < ActiveRecord::Base
  attr_accessible :name
  
  translates :name
  
  belongs_to :animal
  has_many :pets, :through => :pet_diseases
end
