class Adoption < ActiveRecord::Base
  belongs_to :pet
  belongs_to :adoptant, :class_name => 'User', :foreign_key => 'adoptant_id'
  
  validates_presence_of :reasons
end
