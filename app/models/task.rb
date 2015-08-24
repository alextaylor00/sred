class Task < ActiveRecord::Base
  # Associations
  belongs_to :job

  # Validations
  validates :fp_id,
            :title,
            presence: true

  # Scopes


  # Callbacks

  # Misc

end
