class SearchesController < ApplicationController
  def show
  end

  def create
    @start_station = RailwayStation.find(search_params[:start_station_id])
    @end_station = RailwayStation.find(search_params[:end_station_id])

    @trains = Train.find_trains_by(@start_station, @end_station)
    redirect_to search_path, notice: 'Trains not found!' if @trains.blank?
  end

  def search_params
    params.require(:search).permit(:start_station_id, :end_station_id, :train_id)
  end
end
