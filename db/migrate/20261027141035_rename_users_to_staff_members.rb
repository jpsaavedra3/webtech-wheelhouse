class RenameUsersToStaffMembers < ActiveRecord::Migration[8.1]
  def change
    rename_table :users, :staff_members
  end
end
