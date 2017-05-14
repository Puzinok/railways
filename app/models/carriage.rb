class Carriage < ApplicationRecord
  belongs_to :train, optional: true

  before_validation :set_number

  validates :upper_seat,
            :bottom_seat,
            :side_upper_seat,
            :side_bottom_seat,
            :sitting_seat,
            :number, numericality: { allow_nil: true, only_integer: true,
                                     greater_than_or_equal_to: 0 }
  
  validates :number, uniqueness:{ scope: :train_id }
  
  private

  def set_number
    if self.train.carriages.first.nil?
      self.number = 1
    else
      self.number = self.train.carriages.last.number + 1
    end
  end
end
