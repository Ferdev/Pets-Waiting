class Size < ActiveRecord::Base
  attr_accessible :name
  
  translates :name
  
  has_many :pets

end
