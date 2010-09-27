class Disease < ActiveRecord::Base
  translates :name
  
  belongs_to :animal
  has_and_belongs_to_many :pets
end
