class AddRailwayStationSerialToRailwayStationsRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :railway_stations_routes, :railway_station_serial, :integer
  end
end
