class AddNumberingColToTrain < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :numbering, :boolean
  end
end
