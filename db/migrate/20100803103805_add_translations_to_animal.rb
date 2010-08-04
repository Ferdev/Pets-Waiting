class AddTranslationsToAnimal < ActiveRecord::Migration
  def self.up
    Animal.create_translation_table! :name => :string
  
    dog = Animal.new
    dog.add_translation('es', :name => 'Perro')
    dog.add_translation('en', :name => 'Dog')
  
    cat = Animal.new
    cat.add_translation('es', :name => 'Gato')
    cat.add_translation('en', :name => 'Cat')
  
    bird = Animal.new
    bird.add_translation('es', :name => 'Ave')
    bird.add_translation('en', :name => 'Bird')

    rodent = Animal.new
    rodent.add_translation('es', :name => 'Pequeños mamíferos')
    rodent.add_translation('en', :name => 'Little mammals')

    reptile = Animal.new
    reptile.add_translation('es', :name => 'Reptil')
    reptile.add_translation('en', :name => 'Reptile')

    other = Animal.new
    other.add_translation('es', :name => 'Otra especie')
    other.add_translation('en', :name => 'Other species')
  end

  def self.down
    Animal.delete_all
    Animal.drop_translation_table!
  end
end
