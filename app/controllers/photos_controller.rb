class PhotosController < ApplicationController
  before_filter :get_pet
  
  def index
    @photos = @pet.photos
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @photo = @pet.photos.new
    
    respond_to do |format|
      format.html
    end
  end

  def edit
    @photo = @pet.photos.find(params[:id])
  end

  def create
    @photo = @pet.photos.new(params[:photo])

    respond_to do |format|
      begin
        @photo.save!
        format.html { redirect_to(edit_pet_photo_path(@pet, @photo), :notice => I18n.t('pets.photos.create.success')) }
      rescue Exception => e
        flash.now[:error] = I18n.t('pets.photos.create.error')
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @photo = @pet.photos.find(params[:id])

    respond_to do |format|
      begin
        @photo.update_and_crop(params[:photo])
        format.html { redirect_to(pet_photos_url, :notice => I18n.t('pets.photos.update.success')) }
      rescue Exception => e
        flash.now[:error] = I18n.t('pets.photos.update.error')
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @photo = @pet.photos.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to(pet_photos_url) }
    end
  end
end
