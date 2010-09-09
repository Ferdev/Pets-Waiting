class Sex < ActiveRecord::Base
  translates :name
  
  def self.where_sex_is(sex)
    joins("INNER JOIN #{translations_table_name} ON #{translations_table_name}.sex_id = sexes.id").where("#{translations_table_name}.name" => sex).first
  end

  def self.male
    where_sex_is 'Male'
  end

  def self.female
    where_sex_is 'Female'
  end
end
