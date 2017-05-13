class CoupeCarriage < Carriage
  validates :bottom_seat, :upper_seat, presence: true
end
