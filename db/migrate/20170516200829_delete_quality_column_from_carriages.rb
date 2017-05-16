class DeleteQualityColumnFromCarriages < ActiveRecord::Migration[5.0]
  def change
    remove_column :carriages, :quality
  end
end
