module GlobalizeUtils

  def add_locale( locale, translations = {} )
    I18n.locale = locale
    self.update_attributes!(translations)
    self.reload
  end
  
end