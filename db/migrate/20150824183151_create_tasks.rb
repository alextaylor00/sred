class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :fp_id
      t.string :title
      t.string :description
      t.integer :job_id

      t.timestamps null: false
    end
  end
end
