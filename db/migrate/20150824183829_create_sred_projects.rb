class CreateSredProjects < ActiveRecord::Migration
  def change
    create_table :sred_projects do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
