module UsesFpId
  extend ActiveSupport::Concern

  def to_param
    "#{fp_id}"
  end
end
