class Adoption < ActiveRecord::Base
  belongs_to :pet
  belongs_to :adoptant, :class_name => 'User', :foreign_key => 'adoptant_id'
  
  validates_presence_of :reasons
  validates_uniqueness_of :pet_id, :scope => :adoptant_id
  
  scope :request_received, lambda { |user_id| joins(:pet).where('pets.user_id' => user_id) }
  scope :adopted, where('adopted' => true)
  
  def mark_as_adopted
    new_state = !adopted
    pet.adoptions.each { |adoption| adoption.update_attribute('adopted', false) } if new_state
    update_attribute('adopted', new_state)
  end
  
  def external_adoption?
    reasons.match(/#{I18n.t('pets.adoptions.new.external_adoption')}/)
  end
end
