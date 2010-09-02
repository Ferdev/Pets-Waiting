class Size < ActiveRecord::Base
  translates :name
  
  belongs_to :pet

end
