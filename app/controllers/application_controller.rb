class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout 'petswaiting'
  
  before_filter :set_locale
  
  @@available_locales = %w{en es}
  
  private
    
    def set_locale
      I18n.locale = request.preferred_language_from(@@available_locales)
    end
end
