class Pet < ActiveRecord::Base
  belongs_to :animal
  belongs_to :breed
end
