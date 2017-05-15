class AddTypeToCarriages < ActiveRecord::Migration[5.0]
  def change
    change_table :carriages do |t|
      t.integer :number
      t.integer :side_upper_seat
      t.integer :side_bottom_seat
      t.integer :sitting_seat

      t.string :type
    end
  end
end
