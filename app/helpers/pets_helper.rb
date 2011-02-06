# encoding: UTF-8
module PetsHelper
  def breed_for_animal(pet)
    return [I18n.t('pets._form.select_animal_first')] if pet.nil? || pet.animal.nil?
    pet.animal.breed
  end

  def render_pets_list
    unless request.xhr?
      render :partial => 'index_header', :locals => { :pets => @pets }
    else
      render @pets
    end
  end

  def pets_list_item_class(pet)
    classes = []
    classes << pet.animal.name.downcase if pet.animal
    classes << 'urgent' if pet.urgent
    classes
  end

  def method_missing(m, *args)
    if method_name  = /classes_for_(\w*)_button/.match(m.to_s)
        button_name = method_name[1]
        classes     = [:button]
      if button_name.match(/all/)
        classes.push(:active) if @filters.blank?
      else
        classes.push(:active) if @filters.present? && @filters[:animal_id] && @filters[:animal_id].include?( Animal.send("#{button_name}").id.to_s )
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

  def photos(pet)
    images = []
    classes = %w(active photo)
    pet.photos.each_with_index do |photo, i|
      images << image_tag(photo.image.url, :class => classes.join(' ')) if photo && photo.image && photo.image.url
      classes.delete('active')
    end
    images.join
  end
end
