module PetsHelper
  def breed_for_animal(pet)
    return I18n.t('pets._form.select_animal_first') if pet.nil? || pet.animal.nil?
    Breed.by_animal_id(pet.animal_id)
  end
  
  def critters
    %w{
      batty.png
      dog2.png
      elephant.png
      froggy.png
      lion.png
      penguin.png
      tuqui.png
      dog1.png
      ducky.png
      foxy.png
      kitty.png
      panda.png
      ratty.png
    }
  end
  
  def random_critter
    "icons/critters/#{critters.choice}"
  end
  
  def thumbnail(pet)
    thumbnail = pet.random_thumbnail
    img_src = thumbnail ? thumbnail.url : random_critter
    image_tag(img_src)
  end
  
  def thumbnail_list(pet)
    thumbnails = pet.thumbnails
    unless thumbnails.nil? || thumbnails.empty?
      thumbnails.each do |photo|
        haml_tag :li do
          haml_concat(link_to(image_tag(photo.image.thumb.url), photo.image.url))
        end
      end
    else
      critter_src = random_critter
      haml_tag :li do
        haml_concat(link_to(image_tag(critter_src), image_path(critter_src)))
      end
    end
  end
  
  def render_pets_list
    unless request.xhr?
      render :partial => 'index_header', :locals => { :pets => @pets } 
    else
      render @pets
    end
  end
  
  def method_missing(method_name)
    if button_name = /classes_for_(\w*)_button/.match(method_name.to_s)[1]
      classes = [:button]
      if button_name.match(/urgent/)
        classes.push(:active) if @filters[:urgent]
      elsif button_name.match(/male|female/)
        classes.push(:active) if @filters[:sex_id] && @filters[:sex_id].include?( Sex.send("#{button_name}").id.to_s )
      else
        classes.push(:active) if @filters[:animal_id] && @filters[:animal_id].include?( Animal.send("#{button_name}").id.to_s )
      end
      classes
    end
  end
  
end
