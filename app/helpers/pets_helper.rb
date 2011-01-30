# encoding: UTF-8
module PetsHelper
  def breed_for_animal(pet)
    return [I18n.t('pets._form.select_animal_first')] if pet.nil? || pet.animal.nil?
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
    "icons/critters/#{critters.sample}"
  end

  def thumbnail(pet)
    thumbnail = pet.random_thumbnail
    img_src = thumbnail ? thumbnail.url : random_critter
    image_tag img_src, :size => '200x200'
  end

  def thumbnail_list(pet)
    thumbnails = pet.thumbnails

    return if thumbnails.blank?

    thumbnails.each do |photo|
      haml_tag :li do
        haml_concat(link_to(image_tag(photo.image.thumb.url, :size => '200x200'), photo.image.url))
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

  def method_missing(m, *args)
    if method_name  = /classes_for_(\w*)_button/.match(m.to_s)
        button_name = method_name[1]
        classes     = [:button]
      if button_name.match(/urgent/)
        classes.push(:active) if @filters[:urgent]
      elsif button_name.match(/male|female/)
        classes.push(:active) if @filters[:sex_id] && @filters[:sex_id].include?( Sex.send("#{button_name}").id.to_s )
      else
        classes.push(:active) if @filters[:animal_id] && @filters[:animal_id].include?( Animal.send("#{button_name}").id.to_s )
      end
      return classes
    end
    raise NoMethodError.new("Method #{m} not found", m, *args)
  end

  def activate_adopted_button(pet)
    classes = %w(adopted)
    classes << 'active' if pet.adopted?
    classes.join(' ')
  end
end
