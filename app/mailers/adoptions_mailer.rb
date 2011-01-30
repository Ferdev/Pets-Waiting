# encoding: UTF-8
class AdoptionsMailer < ActionMailer::Base
  default :from => "fur@petswaiting.com"

  def adoption_request(adoption)
    @pet          = adoption.pet
    @user         = adoption.adoptant
    @message      = adoption.reasons
    @current_user = adoption.pet.user
    mail(
      :to => @pet.user.email,
      :subject => I18n.t('mailer.adoptions.adoption_request.subject', :petname => @pet.name.capitalize)
    )
  end
end
