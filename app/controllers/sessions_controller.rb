# encoding: UTF-8
class SessionsController < ApplicationController
  skip_before_filter :authenticate_user!

  def change_language
    if params[:new_locale]
      I18n.locale = params[:new_locale]
      cookies[:current_locale] = {:value => I18n.locale, :expires => 1.year.from_now}
      current_user.update_attribute('locale', I18n.locale) if user_signed_in? && current_user.locale != I18n.locale
    end

    redirect_to session[:last_get_url]
  end

end