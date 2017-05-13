class EconomyCarriage < Carriage
  validates :upper_seat,
            :bottom_seat,
            :side_upper_seat,
            :side_bottom_seat, presence: true
end
