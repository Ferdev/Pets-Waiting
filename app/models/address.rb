class Address < ActiveRecord::Base
  belongs_to :user
  belongs_to :pet
  
  validates_presence_of :address
end
