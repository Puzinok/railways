class Carriage < ApplicationRecord
  belongs_to :train, optional: true

  validates :upper_seat, :bottom_seat, numericality: { only_integer: true,
                                                       greater_than_or_equal_to: 0 }
end
