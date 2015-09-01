module StaffMembersHelper
  def staff_member_full_name(staff_member)
    "#{staff_member.first_name} #{staff_member.last_name}"
  end

  def staff_member_total_hours_ytd(staff_member)
    staff_member.timesheets.sum("hours").to_s
  end
end
