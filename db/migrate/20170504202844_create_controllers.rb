class CreateControllers < ActiveRecord::Migration[5.0]
  def change
    create_table :controllers do |t|
      t.string :railways_station
      t.string :name

      t.timestamps
    end
  end
end
