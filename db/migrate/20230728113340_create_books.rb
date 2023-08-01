class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string  :title
      t.string  :category
      t.date    :published_date
      t.integer :quantity
      t.integer :rent

      t.timestamps
    end
  end
end
