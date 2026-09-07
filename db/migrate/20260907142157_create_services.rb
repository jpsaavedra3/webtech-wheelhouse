class CreateServices < ActiveRecord::Migration[8.1]
  def change
    create_table :services do |t|
      t.string :name, null: false, index: { unique: true }
      t.text :description
      t.decimal :price, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
