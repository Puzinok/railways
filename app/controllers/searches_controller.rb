class SearchesController < ApplicationController
  def show
  end

  def results
    @start_station = RailwayStation.find(search_params[:start_station])
    @end_station = RailwayStation.find(search_params[:end_station])

    @trains = Route.find_trains(@start_station, @end_station).flatten
  end

  def search_params
    params.require(:search).permit(:start_station, :end_station)
  end
end
