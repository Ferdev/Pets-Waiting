class Pet < ActiveRecord::Base
  after_initialize :init_address
  
  belongs_to :animal
  belongs_to :breed
  has_one :address
  
  accepts_nested_attributes_for :address
  
  def init_address
    build_address unless address
  end
end
