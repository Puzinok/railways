class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  default_scope -> { order(:position) }

  validates :railway_station_id, uniqueness: { scope: :route_id }
end
