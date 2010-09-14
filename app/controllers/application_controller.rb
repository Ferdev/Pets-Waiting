class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
  before_filter :authenticate_user!
  
  @@available_locales = %w{es en}
  
  private
    
    def set_locale
      I18n.locale = request.env['rack.locale'].to_sym
      current_user.update_attribute('locale', I18n.locale) if current_user && current_user.locale != I18n.locale
    end
    
    def get_pet
      @pet = Pet.find(params[:pet_id])
    end

end
