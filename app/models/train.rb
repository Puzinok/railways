class Train < ApplicationRecord
  has_many :tickets

  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true

  validates :number, presence: true
end
