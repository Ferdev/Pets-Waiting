class AdoptionsController < ApplicationController
  before_filter :get_pet
  
  def new
    @adoption = @pet.adoptions.new
    
    respond_to do |format|
      format.html
    end
  end
  
  def create
    adoption = @pet.adoptions.new(params[:adoption])
    adoption.adoptant = current_user
    adoption.pet = @pet
    

    if adoption.save
      I18n.with_locale @pet.user.locale do
        AdoptionsMailer.adoption_request(adoption).deliver
      end

      flash[:success] = I18n.t('pets.adoptions.create.success', :owner => @pet.user.name.capitalize)
    else
      flash[:error] = I18n.t('pets.adoptions.create.fail', :owner => @pet.user.name.capitalize)
    end
    
    respond_to do |format|
      format.html { redirect_to(root_url) }
    end

  end
end