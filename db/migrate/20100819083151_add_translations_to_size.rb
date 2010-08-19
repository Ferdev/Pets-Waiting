class AddTranslationsToSize < ActiveRecord::Migration
  def self.up
    Size.create_translation_table! :name => :string
    
    huge = Size.new
    huge.add_translation('es', :name => 'Enorme')
    huge.add_translation('en', :name => 'Huge')    

    big = Size.new
    big.add_translation('es', :name => 'Grande')
    big.add_translation('en', :name => 'Big')
    
    medium = Size.new
    medium.add_translation('es', :name => 'Mediano')
    medium.add_translation('en', :name => 'Medium')
    
    small = Size.new
    small.add_translation('es', :name => 'Pequeño')
    small.add_translation('en', :name => 'Small')
    
    tiny = Size.new
    tiny.add_translation('es', :name => 'Enano')
    tiny.add_translation('en', :name => 'Tiny')
  end

  def self.down
    Size.delete_all
    Size.drop_translation_table!
  end
end
