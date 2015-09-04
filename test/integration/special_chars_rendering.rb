require "test_helper"


class SpecialCharsRendering < ActionDispatch::IntegrationTest
  test "special characters are escaped correctly in views" do
    post import_timesheets_path, file: fixture_file_upload("/fp_timesheet_export_test_data_special_chars.csv","text/csv")
    timesheet = Timesheet.find_by(fp_id: 1015)
    debugger
    get timesheet_path(timesheet.id)
    debugger
  end
end
