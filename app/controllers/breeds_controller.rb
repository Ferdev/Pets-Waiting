class BreedsController < ApplicationController
  def index
    breeds = unless params[:animal_id].blank?
      Breed.by_animal_id(params[:animal_id])
    else
      [{:breed => {:name => I18n.t('pets._form.select_animal_first')}}]
    end

    respond_to do |format|
      format.json { render :json => breeds}
    end
  end
end