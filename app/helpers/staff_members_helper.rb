module StaffMembersHelper
  def full_name(staff_member)
    "#{staff_member.first_name} #{staff_member.last_name}"
  end
end
