class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :reservation_date
      t.string :status

      t.timestamps
    end
  end
end
