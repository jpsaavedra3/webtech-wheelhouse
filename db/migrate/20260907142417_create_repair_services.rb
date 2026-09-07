class CreateRepairServices < ActiveRecord::Migration[8.1]
  def change
    create_table :repair_services do |t|
      t.references :repair, null: false
      t.references :service, null: false
      t.references :mechanic
      t.decimal :charged_price, precision: 10, scale: 2, null: false
      t.datetime :completed_at

      t.timestamps
    end
  end
end