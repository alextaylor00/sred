require 'test_helper'

class JobTest < ActiveSupport::TestCase
  test "jobs should have tasks" do
    job = jobs(:one)
    assert_equal 2, job.tasks.count
  end
end
