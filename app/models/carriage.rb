class Carriage < ApplicationRecord
  belongs_to :train, optional: true

  scope :economy, -> { where(type: 'EconomyCarriage') }
  scope :coupe, -> { where(type: 'CoupeCarriage') }
  scope :slepping, -> { where(type: 'SleppingCarriage') }
  scope :sitting, -> { where(type: 'SittingCarriage') }

  before_validation :set_number

  validates :number, numericality: { allow_nil: true, only_integer: true,
                                     greater_than_or_equal_to: 0 }

  validates :number, uniqueness: { scope: :train_id }

  def self.types
    %w[EconomyCarriage CoupeCarriage SleppingCarriage SittingCarriage]
  end

  private

  def set_number
    self.number ||= train.carriages.count + 1
  end
end
