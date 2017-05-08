class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.integer :train_id
      t.integer :start_station_id
      t.integer :end_station_id
    end
  end
end
