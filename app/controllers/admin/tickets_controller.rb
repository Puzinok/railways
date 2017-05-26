class Admin::TicketsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :destroy, :edit, :update]

  def index
    @tickets = Ticket.all
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
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to [:admin, @ticket]
    else
      redirect_to search_path, notice: 'Ticket not  purchased!!!'
    end
  end

  def edit
    @train = @ticket.train
    @start_station = @ticket.start_station
    @end_station = @ticket.end_station
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to [:admin, @ticket], notice: 'Ticket was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_url, notice: 'Ticket was successfully destroyed.'
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:start_station_id,
                                   :end_station_id,
                                   :train_id,
                                   :full_name,
                                   :passport,
                                   :user_id)
  end
end
