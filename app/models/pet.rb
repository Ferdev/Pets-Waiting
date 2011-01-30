# encoding: UTF-8
class Pet < ActiveRecord::Base
  after_initialize :init_address

  attr_accessible :name,
                  :animal_id,
                  :breed_id,
                  :address_attributes,
                  :birthday,
                  :size_id,
                  :urgent,
                  :diseases_attributes,
                  :description,
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
                  :friendly_animals,
                  :sex_id,
                  :sterilized,
                  :vaccinated

  belongs_to :animal
  belongs_to :breed
  belongs_to :sex
  belongs_to :size
  belongs_to :user

  has_one   :address, :dependent => :destroy
  has_many  :photos, :dependent => :destroy
  has_many  :adoptions, :dependent => :destroy
  has_many  :pet_diseases, :dependent => :destroy
  has_many  :diseases, :through => :pet_diseases

  accepts_nested_attributes_for :address, :allow_destroy => true
  accepts_nested_attributes_for :diseases, :allow_destroy => true

  validates_presence_of :name
  validates_presence_of :animal
  validates_presence_of :breed
  validates_presence_of :sex
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

  def thumbnails
    unless photos.empty?
      photos.select { |photo| photo.has_thumbnail? }
    end
  end

  def random_thumbnail
    thumbnails.sample.image.thumb unless thumbnails.nil? || thumbnails.empty?
  end

  def self.filtered(filters)
    pets = scoped
    if filters.present?
      pets = pets.where('animal_id' => filters[:animal_id]) unless filters[:animal_id].blank?
      pets = pets.where('urgent' => true) if filters[:urgent]
      pets = pets.where('sex_id' => filters[:sex_id]) unless filters[:sex_id].blank?
    end
    pets.order("pets.created_at DESC")
  end

  def self.adopted
    joins(:adoptions).where('adoptions.adopted' => true)
  end

  def self.not_adopted
    adopted_ids = adopted.map{|pet| pet.id}
    adopted_ids.blank? ? scoped : scoped.where('id NOT IN (?)', adopted_ids)
  end

  def adopted?
    adoptions.adopted.present?
  end
end
