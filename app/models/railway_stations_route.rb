class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  default_scope -> { order(:railway_station_serial) }

  validates :railway_station_id, uniqueness: { scope: :route_id }
end
