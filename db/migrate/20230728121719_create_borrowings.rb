class CreateBorrowings < ActiveRecord::Migration[7.0]
  def change
    create_table :borrowings do |t|
      t.date :issue_date
      t.date :due_date
      t.date :returned_date

      t.timestamps
    end
  end
end
