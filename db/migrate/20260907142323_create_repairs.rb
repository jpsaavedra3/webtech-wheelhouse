class CreateRepairs < ActiveRecord::Migration[8.1]
  def change
    create_table :repairs do |t|
      t.references :bike, null: false
      t.references :received_by, null: false
      t.references :quote_answered_by
      t.string :state, null: false, default: "received"
      t.datetime :received_at, null: false
      t.date :promised_on, null: false
      t.datetime :quote_answered_at
      t.datetime :collected_at

      t.timestamps
    end
  end
end