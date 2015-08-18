class ChangeStaffOnTimesheets < ActiveRecord::Migration
  def change
    rename_column :timesheets, :staff, :staff_initials
  end
end
