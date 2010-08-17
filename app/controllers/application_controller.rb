class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
  
  @@available_locales = %w{es en}
  
  private
    
    def set_locale
      I18n.locale = request.compatible_language_from(@@available_locales)
    end
end
