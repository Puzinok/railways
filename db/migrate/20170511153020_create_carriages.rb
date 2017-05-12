class CreateCarriages < ActiveRecord::Migration[5.0]
  def change
    create_table :carriages do |t|
      t.string :quality
      t.integer :upper_seat
      t.integer :bottom_seat
    end
  end
end
