require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "tasks should belong to a job" do
    assert_equal jobs(:one), tasks(:one).job
  end
end
