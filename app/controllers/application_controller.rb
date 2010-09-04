class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
  before_filter :authenticate_user!
  
  @@available_locales = %w{es en}
  
  private
    
    def set_locale
debugger
      # I18n.locale = request.compatible_language_from(@@available_locales)
      I18n.locale = request.env['rack.locale'].to_sym
    end
end
