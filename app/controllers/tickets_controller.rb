class TicketsController < ApplicationController
  
  def show
    @ticket = Ticket.find(params[:ticket_id])
  end

  def new
    @ticket = Ticket.new
    @departure_time = params[:departure_time]
    @arrival_time = params[:arrival_time]
    @train = Train.find(params[:train_id])
    @start_station = RailwayStation.find(params[:start_station])
    @end_station = RailwayStation.find(params[:end_station])
  end

  def create
    @user = User.first
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      redirect_to search_path
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit( :start_station,
                                    :end_station,
                                    :train,
                                    :full_name,
                                    :passport,
                                    :arrival_time,
                                    :departure_time)
  end
end