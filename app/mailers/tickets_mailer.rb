class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket

    mail(to: user.email, subject: t('common.your_ticket', route: ticket.route_name))
  end

  def cancel_ticket(user, ticket)
    @user = user
    @ticket = ticket

    mail(to: user.email, subject: t('common.cancellation_your_ticket', route: ticket.route_name))
  end
end
