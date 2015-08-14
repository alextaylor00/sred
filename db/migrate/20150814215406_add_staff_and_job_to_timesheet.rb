class AddStaffAndJobToTimesheet < ActiveRecord::Migration
  def change
    add_column :timesheets, :staff, :string
    add_column :timesheets, :job_name, :string
  end
end
