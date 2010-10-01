class Animal < ActiveRecord::Base
  attr_accessible :name
  
  translates :name
  
  has_many :pets
  has_many :breeds
  has_many :diseases
  
  def self.where_animal_is(animal)
    joins("INNER JOIN #{translations_table_name} ON #{translations_table_name}.animal_id = animals.id").where("#{translations_table_name}.name" => animal).first
  end
  
  def self.dog
    where_animal_is 'Dog'
  end
  
  def self.cat
    where_animal_is 'Cat'
  end
  
  def self.bird
    where_animal_is 'Bird'
  end
  
  def self.reptile
    where_animal_is 'Reptile'
  end
  
  def self.little_mammal
    where_animal_is 'Little mammals'
  end
  
  def self.other_species
    where_animal_is 'Other species'
  end
end
