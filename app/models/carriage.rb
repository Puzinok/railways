class Carriage < ApplicationRecord
  belongs_to :train, optional: true

  validates :upper_seat,
            :bottom_seat,
            :side_upper_seat,
            :side_bottom_seat,
            :sitting_seat,
            :number, numericality: { allow_nil: true, only_integer: true,
                                     greater_than_or_equal_to: 0 }
end
