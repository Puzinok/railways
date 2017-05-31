class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    
    mail(to: user.email, subject: t('common.your_buy_ticket'))
  end
end
