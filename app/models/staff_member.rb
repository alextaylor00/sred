class StaffMember < ActiveRecord::Base
  # Associations
  has_many :timesheets

  # Validations
  validates :first_name,
            :last_name,
            :initials,
            presence: true

  # Scopes

  # Callbacks

  # Misc
  def jobs
    Job.joins(:timesheets).where(timesheets: { staff_member: self }).uniq
  end

end
