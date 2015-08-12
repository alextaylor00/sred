class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.integer :fp_id
      t.date :date
      t.string :task_name
      t.string :service_group
      t.string :service
      t.string :description
      t.decimal :hours

      t.timestamps null: false
    end
  end
end
