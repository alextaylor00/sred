require 'test_helper'

class TasksImportTest < ActionDispatch::IntegrationTest
  test "task import via CSV" do
    assert_difference "Task.count", 260 do
      post import_tasks_path, file: fixture_file_upload("/fp_task_export_test_data.csv","text/csv")
    end
  end

  test "task update via CSV" do
    post import_tasks_path, file: fixture_file_upload("/fp_task_export_test_data.csv","text/csv")
    assert_no_difference "Task.count" do
      post import_tasks_path, file: fixture_file_upload("/fp_task_export_test_data.csv","text/csv")
    end
  end

  test "task import via CSV which has been edited in excel" do
    assert_difference "Task.count", 43 do
      post import_tasks_path, file: fixture_file_upload("/fp_task_export_test_data_from_excel.csv","text/csv")
    end
  end
end
