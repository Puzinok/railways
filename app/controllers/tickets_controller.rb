class TicketsController < ApplicationController
 
  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
    @train = Train.find(params[:train_id])
    @start_station = RailwayStation.find(params[:start_station_id])
    @end_station = RailwayStation.find(params[:end_station_id])
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = User.first

    if @ticket.save
      redirect_to ticket_path(@ticket)
    else
      redirect_to newsearch_path, notice: 'Ticket not  purchased!!!'
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:start_station_id,
                                   :end_station_id,
                                   :train_id,
                                   :full_name,
                                   :passport)
  end
end
