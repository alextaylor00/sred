require 'test_helper'

class TimesheetTest < ActiveSupport::TestCase
  test "timesheets should belong to staff and jobs" do
    assert_equal jobs(:one), timesheets(:one).job
    assert_equal staff_members(:staff_member_with_two_timesheets), timesheets(:one).staff_member
  end

  test "in_sred_year should return expected results" do
    assert_equal 1, Timesheet.in_sred_year(2014).count
    assert_equal 4, Timesheet.in_sred_year(2015).count
    assert_equal 1, staff_members(:john).timesheets.in_sred_year(2015).count
  end
end
