class AddUserBorrowingRefToFine < ActiveRecord::Migration[7.0]
  def change
    add_reference :fines, :user, null: false, foreign_key: true
    add_reference :fines, :borrowing, null: false, foreign_key: true
  end
end
