require 'test_helper'

class StaffMemberTest < ActiveSupport::TestCase

  test "timesheets belong to staff members" do
    staff_one = staff_members(:staff_member_with_one_timesheet)
    staff_two = staff_members(:staff_member_with_two_timesheets)

    assert_equal 1, staff_one.timesheets.count
    assert_equal 2, staff_two.timesheets.count
  end

  test "timesheets imported via CSV have staff members" do
    csv_file = File.new(File.expand_path("../../fixtures/fp_timesheet_export_test_data.csv",__FILE__))
    Timesheet.import_from_csv(csv_file)
    assert_equal 330, StaffMember.find_by(initials: "AT").timesheets.count
  end

end
