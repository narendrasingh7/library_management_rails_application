class AddStatusToBorrowings < ActiveRecord::Migration[7.0]
  def change
    add_column :borrowings, :status, :string
  end
end
