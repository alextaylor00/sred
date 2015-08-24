require 'test_helper'

class TimesheetTest < ActiveSupport::TestCase
  test "timesheets should belong to staff and jobs" do
    assert_equal jobs(:one), timesheets(:one).job
    assert_equal staff_members(:staff_member_with_two_timesheets), timesheets(:one).staff_member
  end
end
