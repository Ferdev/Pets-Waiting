class Size < ActiveRecord::Base
  attr_accessible nil
  
  translates :name
  
  belongs_to :pet

end
