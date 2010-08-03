class AddTranslationsToAnimal < ActiveRecord::Migration
  def self.up
    Animal.create_translation_table! :name => :string
  
    dog = Animal.new
    dog.add_locale('es', :name => 'Perro')
    dog.add_locale('en', :name => 'Dog')
  
    cat = Animal.new
    cat.add_locale('es', :name => 'Gato')
    cat.add_locale('en', :name => 'Cat')
  
    bird = Animal.new
    bird.add_locale('es', :name => 'Ave')
    bird.add_locale('en', :name => 'Bird')

    rodent = Animal.new
    rodent.add_locale('es', :name => 'Roedor')
    rodent.add_locale('en', :name => 'Rodent')    

    reptile = Animal.new
    reptile.add_locale('es', :name => 'Reptil')
    reptile.add_locale('en', :name => 'Reptile')

    other = Animal.new
    other.add_locale('es', :name => 'Otra especie')
    other.add_locale('en', :name => 'Other species')
    
  end

  def self.down
    Animal.delete_all
    Animal.drop_translation_table!
  end
end
