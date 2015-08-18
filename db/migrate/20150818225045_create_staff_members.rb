class CreateStaffMembers < ActiveRecord::Migration
  def change
    create_table :staff_members do |t|
      t.string :first_name
      t.string :last_name
      t.string :initials

      t.timestamps null: false
    end
  end
end
