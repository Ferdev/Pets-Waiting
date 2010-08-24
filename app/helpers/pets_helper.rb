module PetsHelper
  def breed_for_animal(pet)
    return I18n.t('pets._form.select_animal_first') if pet.nil? || pet.animal.nil?
    Breed.by_animal_id(pet.animal_id)
  end
end
