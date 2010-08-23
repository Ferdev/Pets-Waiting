class Pet < ActiveRecord::Base
  after_initialize :init_address
  
  belongs_to :animal
  belongs_to :breed
  belongs_to :size
  has_one :address
  
  accepts_nested_attributes_for :address
  
  validates_presence_of :name
  validates_presence_of :animal
  validates_presence_of :breed
  validates_presence_of :birthday
  
  def init_address
    build_address unless address
  end
  
  def character_attributes
  [
    :docile,
    :calm,
    :agressive_people,
    :agressive_animals,
    :dominant,
    :affectionate,
    :independent,
    :dependent,
    :possessive,
    :playful,
    :tireless,
    :obedient,
    :disobedient,
    :trained,
    :sleepyhead,
    :friendly_people,
    :friendly_animals
  ]
  end

  def has_character_attributes?
    character_attributes.each do |char|
      return true if attributes[char]
    end
  end
  
  def character
    result = []
    character_attributes.each do |char|
      result.push(Pet.human_attribute_name(char)) if attributes[char.to_s]
    end
    result
  end
  
  def place
    address.address unless address.nil? || address.address.blank?
  end
end
