class AddTranslationsToSex < ActiveRecord::Migration
  def self.up
    Sex.create_translation_table! :name => :string
    
    male = Sex.new
    male.add_translation('es', :name => 'Macho')
    male.add_translation('en', :name => 'Male')
    
    female = Sex.new
    female.add_translation('es', :name => 'Hembra')
    female.add_translation('en', :name => 'Female')
  end

  def self.down
    Sex.delete_all
    Sex.drop_translation_table!
  end
end
