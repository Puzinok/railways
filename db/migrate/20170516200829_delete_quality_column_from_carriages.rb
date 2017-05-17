class DeleteQualityColumnFromCarriages < ActiveRecord::Migration[5.0]
  def change
    remove_column :carriages, :quality, :string
  end
end
