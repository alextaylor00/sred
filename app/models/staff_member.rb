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


end
