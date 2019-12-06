class EventMailer < ApplicationMailer

  def notification_to_pers_giver(user, giver, receiver)
    @giver = giver
    @receiver = receiver
    @user = user
    mail(to: "#{@giver.email}",  subject: "You're gonna be the Santa of #{@receiver.name}", template_path: 'events',
         template_name: 'notification_to_pers_giver')
  end
end
