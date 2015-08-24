class SredProject < ActiveRecord::Base
  # Associations
  has_many :jobs

  # Validations
  validates :title, presence: true

  # Scopes


  # Callbacks

  # Misc

end
