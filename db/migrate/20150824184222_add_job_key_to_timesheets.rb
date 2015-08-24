class AddJobKeyToTimesheets < ActiveRecord::Migration
  def change
    add_column :timesheets, :job_id, :integer
  end
end
