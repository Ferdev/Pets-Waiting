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
  
  def random_thumbnails
    critters.shuffle.each do |critter|
      haml_tag :li do
        haml_tag :a, :href => image_path("icons/critters/#{critter}") do
          haml_tag :img, :src => image_path("icons/critters/#{critter}"), :alt => 'Critter'
        end
      end
    end
  end
  
  def thumbnail(pet)
    thumbnail = pet.thumbnail
    img_src = thumbnail ? thumbnail.url : "icons/critters/#{critters.choice}"
    image_tag(img_src)
  end
end
