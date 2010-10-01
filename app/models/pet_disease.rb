class PetDisease < ActiveRecord::Base
  attr_accessible :pet_id,
                  :disease_id

  belongs_to :pet
  belongs_to :disease
end
