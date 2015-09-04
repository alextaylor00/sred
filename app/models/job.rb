class Job < ActiveRecord::Base
  include UsesFpId
  
  # Associations
  belongs_to :sred_project
  has_many :timesheets
  has_many :tasks

  # Validations
  validates :fp_id,
            :name,
            presence: true

  # Scopes


  # Callbacks

  # Misc
  # def to_param
  #   "#{fp_id}"
  # end

  def total_hours
    timesheets.sum("hours")
  end

end
