class MoveReceivedByToUsers < ActiveRecord::Migration[8.1]
  def change
    remove_reference :repairs, :received_by, null: false, index: true,
                     foreign_key: { to_table: :staff_members }
    add_reference :repairs, :received_by, foreign_key: { to_table: :users }
  end
end