require 'test_helper'

class TimesheetsImportTest < ActionDispatch::IntegrationTest
  test "timesheet import via CSV" do
    post import_timesheets_path, file: fixture_file_upload('/fp_timesheet_export.csv','text/csv')
  end
end
