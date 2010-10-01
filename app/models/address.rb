class Address < ActiveRecord::Base
  attr_accessible :address,
                  :street,
                  :postal_code,
                  :lat,
                  :lon,
                  :country,
                  :country_code,
                  :state,
                  :substate,
                  :city

  belongs_to :user
  belongs_to :pet
  
  validates_presence_of :address
end
