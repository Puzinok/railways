class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validates :railway_station_ids, presence: true

  before_create :set_name

  private

  def set_name
    self.name = "#{railway_stations.first.name} - #{railway_stations.last.name}"
  end
end
