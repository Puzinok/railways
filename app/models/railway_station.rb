class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_station_id

  # scope :ordered, -> { joins(:railway_stations_routes).order('railway_stations_routes.position').uniq }
  scope :ordered, lambda {
    select('railway_stations.*, railway_stations_routes.position')
      .joins(:railway_stations_routes)
      .order('railway_stations_routes.position')
      .uniq
  }

  def update_position(route, position)
    station_route = station_route(route)
    station_route&.update(position: position)
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def set_time(route, arr_time, dep_time)
    station_route = station_route(route)
    station_route&.update(arrival_time: arr_time)
    station_route&.update(departure_time: dep_time)
  end

  def time_in(route, time)
    station_route(route).try(time)&.strftime('%H:%M')
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.find_by(route: route)
  end
end
