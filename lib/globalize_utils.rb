module GlobalizeUtils

  def add_translation( locale, translations = {} )
    I18n.locale = locale
    self.update_attributes!(translations)
    self.reload
  end
  
end