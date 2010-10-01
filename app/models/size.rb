class Size < ActiveRecord::Base
  attr_accessible :name
  
  translates :name
  
  belongs_to :pet

end
