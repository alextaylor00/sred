module StaffMembersHelper
  def staff_member_full_name(staff_member)
    "#{staff_member.first_name} #{staff_member.last_name}"
  end

  def today_as_date
    Date.new(Time.new.year,Time.new.month,Time.new.day)
  end

  # Returns the starting year for the date given
  # Defaults to today
  def sred_year_for_date(date=today_as_date)
    start_of_year = (Date.new(date.year, 1, 1)..Date.new(date.year, 7, 31))
    if start_of_year.include?(date)
      return date.year - 1
    else
      return date.year
    end
  end

  # Returns a formatted string for displaying SRED date range
  # e.g. "2014/2015"
  def sred_range_for_date(date=today_as_date)
    start_of_year = (Date.new(date.year, 1, 1)..Date.new(date.year, 7, 31))
    if start_of_year.include?(date)
      return "#{(date.year - 1)}/#{date.year}"
    else
      return "#{date.year}/#{date.year + 1}"
    end
  end


  def staff_member_total_hours(staff_member, date)
    staff_member.timesheets.in_sred_year(sred_year_for_date(date)).sum("hours").to_s
  end
end
