class PetsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
    @filters = extract_filters
    
    @pets = Pet.filtered(@filters).paginate :page => get_page, :per_page => 32

    respond_to do |format|
      format.html {render :action => 'index', :layout => request.xhr? ? false : 'application' }
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
  
  private
    def get_page
      params[:page].blank? ? 1 : params[:page]
    end
  
    def extract_filters
      session[:filters] = {} unless session[:filters].present?
      
      # We don't want to process new filters if we're just paginating
      return session[:filters] if params[:page].present?
      
      filters = params[:filters]
      
      unless filters.blank?
        animal_filter(filters)
        urgent_filter(filters)
        sex_filter(filters)
      end
      session[:filters]
    end
    
    def animal_filter(filters)

      if filters[:animal].present?
        animal_id = session[:filters][:animal_id] || []

        if animal_id.include?(filters[:animal])
          animal_id.delete(filters[:animal])
        else
          animal_id.push(filters[:animal])
        end
        session[:filters][:animal_id] = animal_id
      end

    end
    
    def urgent_filter(filters)
      urgent = session[:filters][:urgent]
      session[:filters][:urgent] = !urgent if filters[:urgent]
    end
    
    def sex_filter(filters)
      if filters[:sex].present?
        sex_id = session[:filters][:sex_id] || []

        if sex_id.include?(filters[:sex])
          sex_id.delete(filters[:sex])
        else
          sex_id.push(filters[:sex])
        end
        session[:filters][:sex_id] = sex_id
      end
    end
end
