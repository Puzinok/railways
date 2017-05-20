class SearchesController < ApplicationController
  def show
  end

  def results
    @search_results = Route.find_trains(search_params[:start_station], search_params[:end_station])
  end

  def search_params
    params.require(:search).permit(:start_station, :end_station)
  end
end
