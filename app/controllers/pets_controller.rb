class PetsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
    @pets = Pet.all

    respond_to do |format|
      format.html
    end
  end

  def show
    @pet = Pet.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @pet = Pet.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def create
    @pet = Pet.new(params[:pet])
    @pet.user = current_user

    respond_to do |format|
      if @pet.save
        format.html { redirect_to(@pet, :notice => I18n.t('pets.create.success')) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.user = current_user

    respond_to do |format|
      if @pet.update_attributes(params[:pet])
        format.html { redirect_to(@pet, :notice => I18n.t('pets.create.success')) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy

    respond_to do |format|
      format.html { redirect_to(pets_url) }
    end
  end
end
