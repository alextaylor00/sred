require 'test_helper'

class StaffMembersHelperTest < ActionView::TestCase
  include StaffMembersHelper

  test "should return correct start year" do
    january = Date.new(2015,1,1)
    july = Date.new(2015,7,31)
    august = Date.new(2014,8,1)
    december = Date.new(2014,12,15)
    august15 = Date.new(2015,8,1)
    today = Date.new(Time.new.year,Time.new.month,Time.new.day)

    assert_equal 2014, sred_year_for_date(january)
    assert_equal 2014, sred_year_for_date(july)
    assert_equal 2014, sred_year_for_date(august)
    assert_equal 2014, sred_year_for_date(december)
    assert_equal 2015, sred_year_for_date(august15)
    assert_equal today.year, sred_year_for_date

    assert_equal "2014/2015", sred_range_for_date(january)
    assert_equal "2014/2015", sred_range_for_date(july)
    assert_equal "2014/2015", sred_range_for_date(august)
    assert_equal "2014/2015", sred_range_for_date(december)
    assert_equal "2015/2016", sred_range_for_date(august15)
    assert_equal "#{today.year}/#{today.year + 1}", sred_range_for_date    
  end


end
