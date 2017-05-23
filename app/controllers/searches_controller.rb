class SearchesController < ApplicationController
  def show
  end

  def results
    @start_station = RailwayStation.find(search_params[:start_station])
    @end_station = RailwayStation.find(search_params[:end_station])

    @trains = Train.find_trains_by(@start_station, @end_station)
  end

  def search_params
    params.require(:search).permit(:start_station, :end_station, :train_id, :departure_time, :arrival_time)
  end
end
