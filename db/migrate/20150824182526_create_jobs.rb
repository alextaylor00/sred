class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :fp_id
      t.string :name

      t.timestamps null: false
    end
  end
end
