module GlobalizeUtils

  def add_translation( locale, translations = {} )
    I18n.with_locale locale do
      return if self.translation_exists?(translations)
      self.update_attributes!(translations)
      self.reload
    end
  end
  
  def translation_exists?(translations)
    me = self.class
    translations_table = me.translations_table_name
    me.joins("INNER JOIN #{translations_table} ON #{me.table_name}.id = #{translations_table}.id").where(translations_table => translations).present?
  end
  
end