class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
  before_filter :adoptions_counter
  before_filter :authenticate_user!
  after_filter :store_last_get_uri
  
  private
    
    def set_locale
      user_locale    = current_user.locale if user_signed_in? && current_user.locale.present?
      params_locale  = params[:locale]
      cookie_locale  = cookies[:current_locale]
      browser_locale = request.env['rack.locale']

      I18n.locale = user_locale || cookie_locale || params_locale || browser_locale || I18n.default_locale
    end
    
    def get_pet
      @pet = Pet.find(params[:pet_id]) if params[:pet_id].present?
    end

    def adoptions_counter
      @adopted = Adoption.adopted.count
      @count   = Pet.count
    end
    
    def store_last_get_uri
      session[:last_get_url] = request.fullpath if request.method == 'GET'
    end
end
