class ChangeColRailwaysStationSerialToPosition < ActiveRecord::Migration[5.0]
  def change
    rename_column :railway_stations_routes, :railway_station_serial, :position
  end
end
