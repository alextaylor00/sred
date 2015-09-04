require "test_helper"

class TimesheetsImportTest < ActionDispatch::IntegrationTest
  test "timesheet import via CSV" do
    assert_difference "Timesheet.count", 360 do
      post import_timesheets_path, file: fixture_file_upload("/fp_timesheet_export_test_data.csv","text/csv")
    end
  end

  test "timesheet update via CSV" do
    post import_timesheets_path, file: fixture_file_upload("/fp_timesheet_export_test_data.csv","text/csv")
    assert_no_difference "Timesheet.count" do
      post import_timesheets_path, file: fixture_file_upload("/fp_timesheet_export_test_data.csv","text/csv")
    end
  end

  test "timesheet import via CSV which has been edited in excel" do
    assert_difference "Timesheet.count", 26 do
      post import_timesheets_path, file: fixture_file_upload("/fp_timesheet_export_test_data_from_excel.csv","text/csv")
    end
  end

end
