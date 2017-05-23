class AddFullNameColumnToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :full_name, :string
  end
end
