class CreateBikes < ActiveRecord::Migration[8.1]
  def change
    create_table :bikes do |t|
      t.references :bike_model, null: false
      t.references :customer, null: false
      t.string :serial_number, index: { unique: true }
      t.string :colour

      t.timestamps
    end
  end
end
