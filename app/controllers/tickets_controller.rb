class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :destroy]

  def index
    @tickets = current_user.tickets
  end

  def show
  end

  def new
    @ticket = Ticket.new
    @train = Train.find(params[:train_id])
    @start_station = RailwayStation.find(params[:start_station_id])
    @end_station = RailwayStation.find(params[:end_station_id])
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)

    if @ticket.save
      redirect_to ticket_path(@ticket)
    else
      redirect_to search_path, notice: 'Ticket not  purchased!!!'
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_url, notice: 'Ticket was successfully destroyed.'
  end

  private

  def set_ticket
    @ticket = current_user.tickets.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:start_station_id,
                                   :end_station_id,
                                   :train_id,
                                   :full_name,
                                   :passport)
  end
end
