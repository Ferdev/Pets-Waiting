class User < ActiveRecord::Base
  after_initialize :init_address
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :remember_me
  
  has_one :address
  has_many :pets
  has_many :adoptions, :foreign_key => 'adoptant_id'
  
  accepts_nested_attributes_for :address
  
  validates_presence_of :name, :phone_number
  validates_format_of :phone_number, :with => /^[+]?[-| |\d]*$/
  
  def init_address
    build_address unless address
  end
end
