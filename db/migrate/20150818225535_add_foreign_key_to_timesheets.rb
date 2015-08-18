class AddForeignKeyToTimesheets < ActiveRecord::Migration
  def change
    add_column :timesheets, :staff_member_id, :integer
  end
end
