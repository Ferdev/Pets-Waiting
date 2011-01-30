# encoding: UTF-8
class Size < ActiveRecord::Base
  attr_accessible :name

  translates :name

  has_many :pets

end
