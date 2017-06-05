class Admin::CarriagesController < Admin::BaseController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]
  def index
    @carriages = Carriage.all
  end

  def show
  end

  def new
    @economy_carriage = EconomyCarriage.new
    @coupe_carriage = CoupeCarriage.new
    @sitting_carriage = SittingCarriage.new
    @slepping_carriage = SleppingCarriage.new
  end

  def edit
  end

  def create
    @carriage = @train.carriages.new(carriage_params)

    if @carriage.save
      redirect_to [:admin, @train]
    else
      render :new
    end
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to [:admin, @carriage], notice: 'Carriage was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to [:admin, @carriage.train], notice: 'Carriage was successfully destroyed!'
  end

  private

  def set_carriage
    @carriage = Carriage.find(params[:id]).becomes(Carriage)
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def carriage_params
    params.require(:carriage).permit(:upper_seat,
                                     :bottom_seat,
                                     :side_upper_seat,
                                     :side_bottom_seat,
                                     :sitting_seat,
                                     :train_id,
                                     :type)
  end
end
