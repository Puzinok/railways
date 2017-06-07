class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id

  validates :full_name, :passport, presence: true

  after_create :send_notification
  after_destroy :send_cancellation

  def route_name
    "#{start_station.name} - #{end_station.name}"
  end

  private

  def send_notification
    TicketsMailer.buy_ticket(user, self).deliver_now
  end

  def send_cancellation
    TicketsMailer.cancel_ticket(user, self).deliver_now
  end
end
