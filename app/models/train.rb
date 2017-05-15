class Train < ApplicationRecord
  has_many :tickets
  has_many :carriages, -> { order(number: :asc) }

  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true

  validates :number, presence: true

  def carriages_order
    if numbering
      carriages
    else
      carriages.reverse_order
    end
  end

  def seats_sum(carriage_type, seat_type)
    carriages.where(type: carriage_type).sum(seat_type)
  end
end
