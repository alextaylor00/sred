class Job < ActiveRecord::Base
  # Associations
  belongs_to :sred_project
  has_many :timesheets
  has_many :jobs

  # Validations
  validates :fp_id,
            :name,
            presence: true

  # Scopes


  # Callbacks

  # Misc

end
