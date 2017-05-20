class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validates :name, presence: true

  before_validation :set_name

  def self.find_trains(start_station, end_station)
    joins(:railway_stations).where(railway_stations: { id: start_station, id: end_station }).map(&:trains)
  end

  private

  def set_name
    self.name = "#{railway_stations.first.name} - #{railway_stations.last.name}"
  end
end
