require "test_helper"


class SpecialCharsRendering < ActionDispatch::IntegrationTest
  test "special characters are escaped correctly in views" do
    post import_timesheets_path, file: fixture_file_upload("/fp_timesheet_export_test_data_special_chars.csv","text/csv")
    @test_sheet = Timesheet.find_by(fp_id: 1015)
    get timesheet_path(@test_sheet.fp_id)
    expected_response = "<p>\"This is in double quotes\" and 'this is in single quotes'\n<br />There was a newline before this</p>\n\n<p>There were two newlines before this\n<br />After this &gt; &lt; there is a tab\n<br />Here is a \\back-slash and a /forward-slash</p>"
    assert response.body.include?(expected_response), "Special characters are not being handled correctly."
  end
end
