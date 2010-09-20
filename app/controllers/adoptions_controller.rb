class AdoptionsController < ApplicationController
  before_filter :get_pet
  
  def index
    @user = current_user
    user_id = params[:user_id].present? ? params[:user_id] : @user.to_param
    @adoptions = Adoption.request_received(user_id)
    
    respond_to do |format|
      format.html
    end
  end
  
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
      flash[:error] = I18n.t('pets.adoptions.create.error', :owner => @pet.user.name.capitalize)
    end
    
    respond_to do |format|
      format.html { redirect_to(root_url) }
    end
  end
  
  def edit
    @adoption =  @pet.adoptions.find(params[:id])
    
    respond_to do |format|
      format.html
    end
  end
  
  def update
    @adoption =  @pet.adoptions.find(params[:id])

    if @adoption.mark_as_adopted
      flash[:success] = I18n.t('pets.adoptions.update.success')
    else
      flash[:error] = I18n.t('pets.adoptions.update.error')
    end
    
    respond_to do |format|
      format.html { redirect_to(edit_pet_adoption_path(@pet, @adoption)) }
    end
  end
  
  def destroy
    @adoption =  @pet.adoptions.find(params[:id])
    if @adoption.adopted
      flash[:error] = I18n.t('pets.adoptions.destroy.error')
    elsif
      flash[:success] = I18n.t('pets.adoptions.destroy.success')
      @adoption.destroy
    end
    
    respond_to do |format|
      format.html { redirect_to(pet_adoptions_path(@pet)) }
    end
  end
end