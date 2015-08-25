class StaffMembersController < ApplicationController
  def index
    @staff_members = StaffMember.all
  end

end
