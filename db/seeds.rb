# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_staff_members
  staff_members_csv = File.expand_path('../seed_AdminStaff_List.csv', __FILE__) # exported from Function Point

  begin
    CSV.foreach(staff_members_csv, headers:true, skip_blanks:true) do |row|
      StaffMember.create(
        first_name:   row["First Name"],
        last_name:    row["Last Name"],
        initials:     row["Initials"]
      ) unless row["Status"] == "Inactive"
    end
  rescue CSV::MalformedCSVError
  end # begin/rescue block
end


create_staff_members
