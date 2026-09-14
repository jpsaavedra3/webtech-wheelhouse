class AddForeignKeys < ActiveRecord::Migration[8.1]
  def change
    add_foreign_key :bikes, :bike_models
    add_foreign_key :bikes, :customers

    add_foreign_key :repairs, :bikes
    add_foreign_key :repairs, :users, column: :received_by_id
    add_foreign_key :repairs, :users, column: :quote_answered_by_id

    add_foreign_key :repair_services, :repairs
    add_foreign_key :repair_services, :services
    add_foreign_key :repair_services, :users, column: :mechanic_id
  end
end